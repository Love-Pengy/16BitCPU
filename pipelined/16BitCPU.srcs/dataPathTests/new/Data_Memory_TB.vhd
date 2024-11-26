----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 03:29:35 PM
-- Design Name: 
-- Module Name: Data_Memory_TB - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Data_Memory_tb is
    -- No ports in testbench
end Data_Memory_tb;

architecture Behavioral of Data_Memory_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component Data_Memory
    Port (
        address : in std_logic_vector(15 downto 0);
        writeData : in std_logic_vector(15 downto 0);
        clk : in std_logic;
        memRead : in std_logic;
        memWrite: in std_logic;
        ReadData : out std_logic_vector(15 downto 0)
    );
    end component;

    -- Signal declarations for simulating inputs and outputs
    signal address : std_logic_vector(15 downto 0) := (others => '0');
    signal writeData : std_logic_vector(15 downto 0) := (others => '0');
    signal clk : std_logic := '0';
    signal memRead : std_logic := '0';
    signal memWrite : std_logic := '0';
    signal ReadData : std_logic_vector(15 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    dut: Data_Memory Port map (
        address => address,
        writeData => writeData,
        clk => clk,
        memRead => memRead,
        memWrite => memWrite,
        ReadData => ReadData
    );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Write to address 0x0001
        address <= "0000000000000001";
        writeData <= "0000000000001010";  -- Write value 10 (hex 0x000A)
        memWrite <= '1';
        memRead <= '0';
        wait for clk_period;
        memWrite <= '0';
        
        -- Read from address 0x0001
        address <= "0000000000000001";
        memRead <= '1';
        wait for clk_period;
        memRead <= '0';
        
        -- Wait for a while before finishing
        wait for 20 ns;

        -- Stop the simulation
        wait;
    end process;

end Behavioral;

