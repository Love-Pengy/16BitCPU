----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/24/2024 02:03:39 PM
-- Design Name: 
-- Module Name: programCounter - Behavioral
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

entity programCounter is
  Port (clk : in std_logic;
        readAddress: in std_logic_vector(15 downto 0);
        instruction: out std_logic_vector(15 downto 0) := (others => '0'));
end programCounter;

architecture Behavioral of programCounter is

begin

process(clk, readAddress) 
begin
  if(rising_edge(clk)) then
    instruction <= readAddress;
  end if;
end process;

end Behavioral;
