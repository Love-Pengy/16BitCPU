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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cpuTopLevel_TB is
end cpuTopLevel_TB;

architecture behavior of cpuTopLevel_TB is

    component cpuTopLevel
        Port ( 
            clk : in std_logic;
            clkEnable : in std_logic;
            reset : in std_logic;
            result : out std_logic_vector(15 downto 0)
        );
    end component;

    signal clk         : std_logic := '0';
    signal clkEnable   : std_logic := '1';
    signal reset       : std_logic := '0';
    signal result      : std_logic_vector(15 downto 0);

    constant clk_period : time := 10 ns;

begin

    DUT: cpuTopLevel
        Port map (
            clk => clk,
            clkEnable => clkEnable,
            reset => reset,
            result => result
        );

    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    stim_proc: process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        wait for 100 ns;
        wait;
    end process;

end behavior;

