----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/24/2024 07:40:34 AM
-- Design Name: 
-- Module Name: registers - Behavioral
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
use IEEE.numeric_std.all;
entity registers is
  Port (clk : in std_logic;
        read1, read2, writeReg: in std_logic_vector(2 downto 0); 
        registersWrite: in std_logic;
        writeData: in std_logic_vector(15 downto 0);
        data1, data2: out std_logic_vector(15 downto 0) := (others => '0'));
end registers;

architecture Behavioral of registers is
type registerArray is array (0 to 7) of std_logic_vector(15 downto 0);
signal registerVals : registerArray := (others => (others => '0'));
begin
    
    process(read1, read2, writeReg, writeData, registersWrite) 
        
    begin
      if(rising_edge(clk)) then
        data1 <= registerVals(to_integer(unsigned(read1)));
        data2 <= registerVals(to_integer(unsigned(read2)));
        if(registersWrite = '1') then
            registerVals(to_integer(unsigned(writeReg))) <= writeData;
        end if;
      end if;
    end process;

end Behavioral;
