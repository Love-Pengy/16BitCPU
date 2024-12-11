----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 03:51:03 PM
-- Design Name: 
-- Module Name: Forward_Mux - Behavioral
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

entity Forward_Mux is
  Port (readData, aluResult, wrData: in std_logic_vector(15 downto 0);
        fowardSig: in std_logic_vector(1 downto 0);
        output: out std_logic_vector(15 downto 0));
end Forward_Mux;

architecture Behavioral of Forward_Mux is

begin
    process(readData, aluResult, wrData, fowardSig)
        begin
            case fowardSig is
                when "01" =>
                    output <= wrData;
                when "10" =>
                    output <= aluResult;
                when "00" =>
                    output <= readData;
                when others =>
             end case;
    end process;
end Behavioral;
