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
    0 => X"1201", -- addi $1, $zero, 1; 
    --1 => X"0000", -- add $1, $2, $3
    others => (others => '0')
); 

begin

process(clk, readAddr) 
begin 
    
    if(rising_edge(clk)) then
        instruction <= instructionVals(to_integer(unsigned(readAddr)));
    end if;

end process;

end Behavioral;
