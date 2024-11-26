----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 11:17:42 PM
-- Design Name: 
-- Module Name: Sign_Extend_TB - Behavioral
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

entity Sign_Extend_tb is
    -- No ports for the testbench
end Sign_Extend_tb;

architecture Behavioral of Sign_Extend_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Sign_Extend
        Port (SigIn : in std_logic_vector(5 downto 0);
              SigOut : out std_logic_vector(15 downto 0));
    end component;

    -- Signals to connect to the UUT
    signal SigIn  : std_logic_vector(5 downto 0) := (others => '0');
    signal SigOut : std_logic_vector(15 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    dut: Sign_Extend Port map (
        SigIn => SigIn,
        SigOut => SigOut
    );

    -- Stimulus process to apply test vectors
    stim_proc: process
    begin
        -- Test case 1: Positive input (no sign extension)
        SigIn <= "001100";  -- Input = 12 (0x0C), no sign extension needed
        wait for 10 ns;
        -- Expected SigOut = 0000000000001100

        -- Test case 2: Negative input (sign extension expected)
        SigIn <= "101100";  -- Input = -116 (0x8C), sign bit = 1
        wait for 10 ns;
        -- Expected SigOut = 11111111101100

        -- Test case 3: Zero input
        SigIn <= "000000";  -- Input = 0
        wait for 10 ns;
        -- Expected SigOut = 0000000000000000

        -- Test case 4: Maximum positive value (no sign extension)
        SigIn <= "011111";  -- Input = 127 (0x7F), no sign extension needed
        wait for 10 ns;
        -- Expected SigOut = 00000000011111

        -- Test case 5: Maximum negative value (sign extension expected)
        SigIn <= "111111";  -- Input = -1 (0xFF), sign bit = 1
        wait for 10 ns;
        -- Expected SigOut = 1111111111111111

        -- End the simulation
        wait;
    end process;

end Behavioral;

