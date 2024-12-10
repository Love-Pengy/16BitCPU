----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 12/02/2024 03:37:44 PM
-- Design Name: 
-- Module Name: regComparator - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regComparator is
  Port (in1, in2: in std_logic_vector(15 downto 0); 
        output : out std_logic := '0' );
end regComparator;

architecture Behavioral of regComparator is

begin

    process(in1, in2) 
    begin
        if(in1 = in2) then 
            output <= '1'; 
        else 
            output <= '0';
        end if;
    end process;
end Behavioral;
