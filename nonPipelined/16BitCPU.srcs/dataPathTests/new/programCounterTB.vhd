----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/25/2024 06:20:01 PM
-- Design Name: 
-- Module Name: programCounterTB - Behavioral
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

entity programCounterTB is
end entity;

architecture behavior of programCounterTB is
  constant Tperiod : time := 10 ns;


  signal clk_sig : std_logic := '0';            
  signal readAddress_sig, instruction_sig : std_logic_vector(15 downto 0);
begin

  process(clk_sig) 
  begin 
    clk_sig <= not clk_sig after Tperiod/2;
  end process;
  
 readAddress_sig <= X"0000", X"0001" after 10 ns, X"1000" after 30 ns;

  

 -- this is the component instantiation for the
    -- DUT - the device we are testing
    DUT : entity work.programCounter(Behavioral)
      port map(clk => clk_sig, readAddress => readAddress_sig, instruction => instruction_sig);
end behavior;