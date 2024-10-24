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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux is
   Port (cntrl : in std_logic;
         topin : in std_logic_vector(15 downto 0);
         bottom : in std_logic_vector(15 downto 0);
         output : out std_logic_vector(15 downto 0)
         );
end Mux;

architecture Behavioral of Mux is

begin
    process(cntrl, topin, bottom)
        begin
        if cntrl = '1' then
            output <= topin;
        else
            output <= bottom;
        end if;   
    end process;

end Behavioral;
