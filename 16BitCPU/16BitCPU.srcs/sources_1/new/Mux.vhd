----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2024 03:43:02 PM
-- Design Name: 
-- Module Name: Mux - Behavioral
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

entity Mux is
   Port (cntrl : in std_logic;
         topin : in std_logic_vector(15 downto 0);
         bottom : in std_logic_vector(15 downto 0);
         output : out std_logic_vector(15 downto 0)
         );
end Mux;

architecture Behavioral of Mux is
signal top : std_logic_vector(15 downto 0) := X"0000";
signal bottomIn : std_logic_vector(15 downto 0) := X"0000";

begin
    top <= topin;
    bottomin <= bottom;
    process(cntrl)
        begin
        if cntrl = '1' then
            output <= top;
        else
            output <= bottomIn;
        end if;   
    end process;

end Behavioral;
