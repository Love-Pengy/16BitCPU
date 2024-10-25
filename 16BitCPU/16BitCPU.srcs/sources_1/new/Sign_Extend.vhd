----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2024 03:23:01 PM
-- Design Name: 
-- Module Name: Sign_Extend - Behavioral
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

entity Sign_Extend is
  Port (SigIn : in std_logic_vector(7 downto 0) := "00001100";
        SigOut : out std_logic_vector(15 downto 0)
        );
end Sign_Extend;

architecture Behavioral of Sign_Extend is
begin
    process(SigIn)
        begin
        SigOut(7 downto 0) <= SigIn;
        if SigIn(7) = '1' then
            SigOut(15 downto 8) <= "11111111";
         else
            SigOut(15 downto 8) <= "00000000";
         end if;
    end process;

end Behavioral;
