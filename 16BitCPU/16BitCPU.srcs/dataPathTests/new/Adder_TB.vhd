----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 10:38:37 PM
-- Design Name: 
-- Module Name: Adder_TB - Behavioral
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

entity adder_tb is

end adder_tb;

architecture Behavioral of adder_tb is

    component adder
        Port (BUSA   : in std_logic_vector(15 downto 0);
              BUSB   : in std_logic_vector(15 downto 0);
              RESULT : out std_logic_vector(15 downto 0);
              COUT   : out std_logic);
    end component;

    signal BUSA   : std_logic_vector(15 downto 0) := (others => '0');
    signal BUSB   : std_logic_vector(15 downto 0) := (others => '0');
    signal RESULT : std_logic_vector(15 downto 0);
    signal COUT   : std_logic;

begin
    dut: adder Port map (
        BUSA => BUSA,
        BUSB => BUSB,
        RESULT => RESULT,
        COUT => COUT
    );

    stim_proc: process
    begin
        BUSA <= "0000000000000001";  -- BUSA = 1
        BUSB <= "0000000000000010";  -- BUSB = 2
        wait for 10 ns;
        -- Expected RESULT = 3 (0000_0000_0000_0011), COUT = 0
        
        BUSA <= "1111111111111111";  -- BUSA = 65535 (0xFFFF)
        BUSB <= "0000000000000001";  -- BUSB = 1
        wait for 10 ns;
        -- Expected RESULT = 0 (0000_0000_0000_0000), COUT = 1

        BUSA <= "1000000000000000";  -- BUSA = 32768 (0x8000)
        BUSB <= "1000000000000000";  -- BUSB = 32768 (0x8000)
        wait for 10 ns;
        -- Expected RESULT = 0 (0000_0000_0000_0000), COUT = 1
        
        BUSA <= "0000000000000000";  -- BUSA = 0
        BUSB <= "0000000000000001";  -- BUSB = 0
        wait for 10 ns;
        -- Expected RESULT = 1 (0000_0000_0000_0001), COUT = 0
        wait;
    end process;

end Behavioral;

