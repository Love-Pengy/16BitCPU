----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/23/2024 05:38:06 PM
-- Design Name: 
-- Module Name: instructionMemory - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith; 
use IEEE.numeric_std.ALL;
entity instructionMemory is
  Port (clk: in std_logic;
        readAddr: in std_logic_vector(15 downto 0);
        instruction: out std_logic_vector(15 downto 0) := (others => '0'));
end instructionMemory;

architecture Behavioral of instructionMemory is
type instructionArray is array (0 to 65536) of std_logic_vector(15 downto 0);
--signal instructionVals : instructionArray := (others => (others => '0'));
signal instructionVals : instructionArray := (
    -- remember 
    --Rtype: opcode rs rt rd func
    -- itype: opcode rs rt (dest) imm
    -- jtype: opdcode address
    
    -- addi 
    0 => X"1041", -- addi $1, $zero, 1; 
    1 => X"107F", -- addi $1, $zero, 111111; 0001 000 001 111111 -- put -1 into register
    -- add
    2 => X"0248", -- add $1, $1, $1; 0000 001 001 001 000 -- add -1 to -1 
    3 => X"0250", -- add $2, $1, $1; 0000 001 001 010 000 -- add -2 to -2 
    4 => X"0298", -- add $3, $1, $2; 0000 001 010 011 000 -- add -2 to -4 
    -- sub 
    5 => X"02A1", -- sub $4, $1, $2; 0000 001 010 100 001 -- sub -2 and -4
    6 => X"0869", -- sub $5, $4, $1; 0000 100 001 101 001 -- sub 2 and -2
    -- cutl
    7 => X"1DBF", -- addi $6, $6, 111111; 0001 110 110 111111 -- put -1 into register
    8 => X"4C82", -- cutl $6, $6, 2; 0100 110 110 000010 -- cutl 111111 by 2
    -- cutu
    9 => X"1FFF", -- addi $7, $7, 111111; 0001 111 111 111111 -- put -1 into register
    10 => X"5FC2", -- cutu $7, $7, 2; 0101 111 111 000010
    -- subi 
    11 => X"9022", -- subi $1, $zero, 2; 1001 000 001 000010 -- put -2 in reg 1
    12 => X"927E", -- subi $1, $1, -2; 1001 001 001 111110 -- reset reg 1 to zero 
    -- nandi 
    13 => X"10B3", -- addi $2, $zero, 110011; 0001 000 010 110011 -- put 110011 into reg 2
    14 => X"A4BF", -- nandi $2, $2, 111111; 1010 010 010 111111
    -- jump
    --15 => X"6000", -- jump 0; 0110 000000000000
    --15 => X"6002", -- jump 2; 0110 000000000010
    
    -- beq (REMEMBER BRANCH OFFSET IS THE DIFFERENCE FROM WHERE YOU WANT TO GO - 2)
    15 => X"0008", -- add $1, $zero, $zero; 0000 000 000 001 000
    16 => X"B06F", -- beq $1, $zero, -17; 1011 000 001 10_1111;
    
    others => (others => '1') --others are no ops
    
); 

begin

process(clk, readAddr) 
begin 
    
    --if(rising_edge(clk)) then
        instruction <= instructionVals(to_integer(unsigned(readAddr)/2));
    --end if;

end process;

end Behavioral;
