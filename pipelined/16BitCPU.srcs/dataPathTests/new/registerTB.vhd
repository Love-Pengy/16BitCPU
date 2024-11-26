----------------------------------------------------------------------------------
-- Company: Brandon Frazier
-- Engineer: 
-- 
-- Create Date: 10/24/2024 10:45:52 PM
-- Design Name: 
-- Module Name: registerTB - Behavioral
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

entity registerTB is
end entity;

architecture behavior of registerTB is
  constant TIME_DELAY : time := 20 ns;
  constant NUM_VALS : integer := 22;
  constant Tperiod : time := 10 ns;


  signal clk_sig : std_logic := '0';             
  signal read1_sig, read2_sig, writeReg_sig : std_logic_vector(2 downto 0);
  signal registersWrite_sig : std_logic;
  signal writeData_sig, data1_sig, data2_sig : std_logic_vector(15 downto 0);
begin

  process(clk_sig) 
  begin 
    clk_sig <= not clk_sig after Tperiod/2;
  end process;
  
  read1_sig <= "000", "001" after 10 ns, "000" after 20 ns; 
  read2_sig <= "000", "111" after 10 ns; 
  writeReg_sig <= "000";
  writeData_sig <= X"0010"; 
  registersWrite_sig <= '0', '1' after 20 ns; 
  

 -- this is the component instantiation for the
    -- DUT - the device we are testing
    DUT : entity work.registers(Behavioral)
      port map(clk => clk_sig, read1 => read1_sig, read2 => read2_sig, writeReg => writeReg_sig, registersWrite => registersWrite_sig, writeData => writeData_sig, data1 => data1_sig, data2 => data2_sig);
end behavior;