----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2024 01:58:06 PM
-- Design Name: 
-- Module Name: cpuTopLevel_TB - Behavioral
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

entity cpuTopLevelTB is
end entity;

architecture behavior of cpuTopLevelTB is
  constant Tperiod : time := 10 ns;


  signal clk_sig, clkEnable_sig, reset_sig : std_logic := '0';
begin

  process(clk_sig) 
  
  begin 
    clk_sig <= not clk_sig after Tperiod/2;
  end process;
  
  clkEnable_sig <= '0', '1' after 20 ns;
  reset_sig <= '1', '0' after 10 ns;
  
 -- this is the component instantiation for the
    -- DUT - the device we are testing
    DUT : entity work.cpuTopLevel(Structural)
      port map(clk => clk_sig, clkEnable => clkEnable_sig, reset => reset_sig);
      
end behavior;


