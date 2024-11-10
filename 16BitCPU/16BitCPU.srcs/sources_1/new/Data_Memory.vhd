----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 12:09:34 PM
-- Design Name: 
-- Module Name: Data_Memory - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Data_Memory is
  Port (address : in std_logic_vector(15 downto 0);
        writeData : in std_logic_vector(15 downto 0);
        clk : in std_logic;
        memRead : in std_logic;
        memWrite: in std_logic;
        ReadData : out std_logic_vector(15 downto 0) := (others => '0')
  );
end Data_Memory;

architecture Behavioral of Data_Memory is
    type memory_array is array (0 to 65535) of std_logic_vector(15 downto 0);
    signal dm : memory_array := (
        others => (others => '0')
    );

begin
    process(clk, memRead, memWrite, address)
    begin
        if rising_edge(clk) then
            if memWrite = '1' then
                dm(to_integer(unsigned(address))) <= writeData;
            end if;
            
            if memRead = '1' then
                ReadData <= dm(to_integer(unsigned(address)));
            end if;
        end if;
    end process;


end Behavioral;
