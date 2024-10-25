----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/25/2024 06:04:32 PM
-- Design Name: 
-- Module Name: instructionMemoryTB - Behavioral
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

entity instructionMemoryTB is
end entity;

architecture behavior of instructionMemoryTB is
  constant TIME_DELAY : time := 20 ns;
  constant Tperiod : time := 10 ns;


  signal clk_sig : std_logic := '0';
  signal readAddr_sig, instruction_sig : std_logic_vector(15 downto 0);
begin

  process(clk_sig) 
  begin 
    clk_sig <= not clk_sig after Tperiod/2;
  end process;
  
 readAddr_sig <= X"0000", X"0001" after 10 ns, X"0002" after 20 ns, X"0003" after 30 ns, X"0004" after 40 ns, X"0005" after 50 ns, X"0006" after 60 ns, X"0007" after 70 ns; 

  

 -- this is the component instantiation for the
    -- DUT - the device we are testing
    DUT : entity work.instructionMemory(Behavioral)
      port map(clk => clk_sig, readAddr => readAddr_sig, instruction => instruction_sig);
end behavior;

