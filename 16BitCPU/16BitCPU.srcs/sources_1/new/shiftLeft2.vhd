----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/23/2024 06:28:03 PM
-- Design Name: 
-- Module Name: shiftLeft2 - Behavioral
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
use IEEE.numeric_std.ALL;
entity shiftLeft2 is
  Port (input: in std_logic_vector(11 downto 0) := (others => '0');
        output: out std_logic_vector(15 downto 0));
end shiftLeft2;

architecture Behavioral of shiftLeft2 is

begin

process(input) 
variable paddedInput : std_logic_vector(15 downto 0);
begin
    paddedInput := X"0000";
    paddedInput(13 downto 2) := input;
    output <= paddedInput;
    --output <= std_logic_vector(unsigned(input), 16) SLL 2);
end process;

end Behavioral;
