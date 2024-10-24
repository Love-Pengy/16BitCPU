----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/24/2024 01:16:49 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
  Port (in1, in2: in std_logic_vector(15 downto 0);
        output: out std_logic_vector(1 downto 0));
end comparator;

architecture Behavioral of comparator is
    
begin
    
    -- 00 = equal
    -- 01 = in1 greater
    -- 10 = in2 greater
    process(in1, in2) 
        variable tmp : std_logic;
    begin
        output <= "00";
        for i in 15 downto 0 LOOP
            tmp := in1(i) XNOR in2(i);
            if(tmp = '0') then 
                if(in1(i) = '1') then
                    output <= "01";
                 else 
                    output <= "10";
                 end if;
            end if;
        end LOOP;
    
    end process;

end Behavioral;
