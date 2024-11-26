----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/24/2024 11:19:59 PM
-- Design Name: 
-- Module Name: aluControlTB - Behavioral
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

entity aluControlTB is
end entity;

architecture behavior of aluControlTB is
  constant TIME_DELAY : time := 20 ns;
  constant Tperiod : time := 10 ns;


  signal clk_sig, aluOp_sig: std_logic := '0';             
  signal opCode_sig, output_sig : std_logic_vector(2 downto 0);
begin

  process(clk_sig) 
  begin 
    clk_sig <= not clk_sig after Tperiod/2;
  end process;
  
  aluOp_sig <= '0', '1' after 10 ns;
  opCode_sig <= "000", "001" after 20 ns, "010" after 30 ns, "011" after 40 ns, "100" after 50 ns, "101" after 60 ns, "110" after 70 ns;
  

 -- this is the component instantiation for the
    -- DUT - the device we are testing
    DUT : entity work.aluControl(Behavioral)
      port map(ALUOp => aluOp_sig, opCode => opCode_sig, output => output_sig);
end behavior;