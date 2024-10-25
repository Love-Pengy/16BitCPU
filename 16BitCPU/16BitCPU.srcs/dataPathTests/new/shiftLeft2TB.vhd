----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2024 06:26:25 PM
-- Design Name: 
-- Module Name: shiftLeft2TB - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shiftLeft2TB is
end entity;

architecture behavior of shiftLeft2TB is
  constant Tperiod : time := 10 ns;
           
  signal output_sig : std_logic_vector(15 downto 0);
  signal input_sig : std_logic_vector(11 downto 0);
begin


input_sig <= B"0000_0000_0000", B"0000_0000_0001" after 10 ns, B"1110_0000_0000" after 20 ns, X"002" after 30 ns;
  

 -- this is the component instantiation for the
    -- DUT - the device we are testing
    DUT : entity work.shiftLeft2(Behavioral)
      port map(input => input_sig, output => output_sig);
end behavior;