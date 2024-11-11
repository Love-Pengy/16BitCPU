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
    -- itype: opcode rt rs imm
    -- jtype: opdcode address
    
    -- addi 
    0 => X"1041", -- addi $1, $zero, 1; 
    1 => X"107F", -- addi $1, $zero, 111111; 0001 000 001 111111 -- put -1 into register
    -------------
    others => (others => '1') --others are no ops
); 

begin

process(clk, readAddr) 
begin 
    
    if(rising_edge(clk)) then
        instruction <= instructionVals(to_integer(unsigned(readAddr)/2));
    end if;

end process;

end Behavioral;
