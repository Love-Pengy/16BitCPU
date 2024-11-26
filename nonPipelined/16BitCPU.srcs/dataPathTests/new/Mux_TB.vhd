----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 10:17:53 PM
-- Design Name: 
-- Module Name: Mux_TB - Behavioral
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

entity Mux_tb is
    -- No ports for the testbench
end Mux_tb;

architecture Behavioral of Mux_tb is
    component Mux
        Port (cntrl : in std_logic;
              topin : in std_logic_vector(15 downto 0);
              bottom : in std_logic_vector(15 downto 0);
              output : out std_logic_vector(15 downto 0)
             );
    end component;

    signal cntrl : std_logic := '0';
    signal topin : std_logic_vector(15 downto 0) := (others => '0');
    signal bottom : std_logic_vector(15 downto 0) := (others => '0');
    signal output : std_logic_vector(15 downto 0);

begin

    dut: Mux Port map (
        cntrl => cntrl,
        topin => topin,
        bottom => bottom,
        output => output
    );

    stim_proc: process
    begin
        cntrl <= '0';
        topin <= "0000000000001111";
        bottom <= "1111111111110000";
        
        cntrl <= '1';
        wait for 10 ns;
        
        cntrl <= '0';
        topin <= "1010101010101010";
        bottom <= "0101010101010101";
        wait for 10 ns;
        
        cntrl <= '1';
        wait for 10 ns;

        wait;
    end process;

end Behavioral;

