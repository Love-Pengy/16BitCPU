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
        switchAddress: in std_logic_vector(11 downto 0);
        writeData : in std_logic_vector(15 downto 0);
        clk : in std_logic;
        memRead : in std_logic;
        memWrite: in std_logic;
        ReadData, switchData : out std_logic_vector(15 downto 0) := (others => '0')
  );
end Data_Memory;

architecture Behavioral of Data_Memory is
    type memory_array is array (0 to 65535) of std_logic_vector(15 downto 0);
    -- for testing
    --type memory_array is array (0 to 499) of std_logic_vector(15 downto 0);
    
    -- for test program (reference below test programin lab4.pdf)
    signal dm : memory_array := (
      16 => X"0101", 
      18 => X"0110", 
      20 => X"0011", 
      22 => X"00F0", 
      24 => X"00FF", 
      others => (others => '0')
    ); 
    -- signal dm : memory_array := (
    --     others => (others => '0')
    -- );
    signal clock_cycle : integer := 0;

begin
    process(clk, memRead, memWrite, address)
    begin
        if rising_edge(clk) then
        clock_cycle <= clock_cycle + 1;
            if memWrite = '1' then
                dm(to_integer(unsigned(address))) <= writeData;
            end if; 
        end if;
        if memRead = '1' then
                ReadData <= dm(to_integer(unsigned(address)));
        end if;
        -- don't need to check bounds because 13 bits cannot represent higher than 65k 
        switchData <= dm(to_integer(unsigned(address)));
    end process;


end Behavioral;
