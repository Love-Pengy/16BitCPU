----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/06/2024 06:37:31 PM
-- Design Name: 
-- Module Name: 1bitAdder - Behavioral
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

entity oneBitAdder is
  Port (A: in std_logic;
        B: in std_logic;
        C: out std_logic;
        Cin: in std_logic;
        Cout: out std_logic);
end oneBitAdder;

architecture Behavioral of onebitAdder is

begin

process(A, B, Cin)
    variable x1 : std_logic;
    begin
--        if((NOT A AND NOT B AND NOT Cin) = '1') then 
--            Cout <= '0';
--        elsif((A AND B AND Cin) = '1') then
--            Cout <= '1';
--        else
--            Cout <= A XNOR B XNOR Cin;
--        end if;
        x1 := A XOR B;
        C <= x1 XOR Cin;
        Cout <= (A AND B) OR (x1 AND CIN);
    end process;
    
end Behavioral;

