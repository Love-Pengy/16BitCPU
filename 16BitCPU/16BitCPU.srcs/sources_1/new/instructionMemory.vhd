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
    
    -- or
    -- 0 => B"0000_0010_1001_1010",

    -- and
    -- 1 => B"0000_0010_1001_1011",

    -- sgt
    -- 0 => B"0000_0010_1001_1100",

    -- slt
    -- 0 => B"0000_0010_1001_1101",
    
    -- sw
    -- 0 => B"0011_0011_0100_0100",

    -- lw
    -- 1 => B"0010_0011_1100_0100",

    -- xor
    -- 2 => B"0000_0010_1001_1110",

    -- xnor
    -- 3 => B"0000_0010_1001_1111",

    -- cutl
    -- 0 => B"0100_0010_1000_0010",

    -- cutu
    -- 0 => B"0101_0010_1000_0010",

    -- j
    -- 0 => B"0110_0000_0000_0001",

    -- sll
    -- 0 => B"0111_0010_1000_0011",

    -- srl
    -- 0 => B"1000_0010_1000_0011",

    -- subi
    -- 0 => B"1001_0010_1000_0011",

    -- nandi
    -- 0 => B"1010_0010_1000_0100",

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
