----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 11/18/2024 03:45:29 PM
-- Design Name: 
-- Module Name: topLevel - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topLevel is
  Port (CLK100MHZ : in std_logic;
        SW : in std_logic_vector(15 downto 0);
        CPU_RESETN : in std_logic;
        LED : out std_logic_vector(15 downto 0) := (others => '1'));
        
end topLevel;

architecture Structural of topLevel is
    COMPONENT cpuTopLevel is
        PORT(clk, clkEnable, reset : in std_logic); 
    end COMPONENT;
    FOR ALL: cpuTopLevel use entity work.cpuTopLevel(structural);
begin
    LED(15 downto 0) <= "11011111111111111";
    cpuCalc: cpuTopLevel 
        PORT MAP(clk => CLK100MHZ, clkEnable => SW(0), reset => CPU_RESETN);

end Structural;
