----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2024 04:06:47 PM
-- Design Name: 
-- Module Name: adder - Behavioral
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
use IEEE.numeric_std.ALL;

entity adder is
  Port (BUSA   : in std_logic_vector(15 downto 0);
    	BUSB   : in std_logic_vector(15 downto 0);
    	RESULT : out std_logic_vector(15 downto 0);
    	COUT   : out std_logic := '0' );
end adder;

architecture Behavioral of adder is
    signal A: unsigned(16 downto 0) := (others => '0');
    signal B: unsigned(16 downto 0) := (others => '0');
    signal output: unsigned(16 downto 0);
begin
    process(BUSA, BUSB, A, B, output)
        begin
            A(15 downto 0)  <= unsigned(BUSA);
            B(15 downto 0)  <= unsigned(BUSB);
            output <= A + B;
            
            RESULT <= std_logic_vector(output(15 downto 0));
            COUT <= output(16);
    end process;
end Behavioral;
