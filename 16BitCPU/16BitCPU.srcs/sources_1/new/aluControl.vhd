----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/24/2024 07:23:05 AM
-- Design Name: 
-- Module Name: aluControl - Behavioral
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

entity aluControl is
  Port (
        --check the bit width of this
        ALUOp: in std_logic_vector(3 downto 0); 
        func: in std_logic_vector(2 downto 0);
        output: out std_logic_vector(3 downto 0));
end aluControl;

architecture Behavioral of aluControl is
begin

    process(ALUOp, func)
    begin 
        if(ALUOp = "0000") then
            case func is 
                when "000" => 
                    output <= "0000";
                when "001" => 
                    output <= "0001"; 
                when "010" => 
                    output <= "0011";
                when "011" =>
                    output <= "0110";
                when "100" => 
                    output <= "0100"; 
                when "101" =>
                    output <= "0101";
                when "111" => 
                    output <= "1000";
                when others => 
                    -- nothing
                end case;
        else
            case ALUop is
                when "0001" =>
                    output <= "0000";
                when "0010" =>
                    output <= "0000";
                when "0011" =>
                    output <= "0000";
                when "0100" =>
                    output <= "1001";
                when "0101" =>
                    output <= "1010";
                when "0111" =>
                    output <= "1011";
                when "1000" =>
                    output <= "1100";
                when "1001" =>
                    output <= "0001";
                when others =>
                    --nothing
            end case;
        end if;
    end process; 
    
end Behavioral;
