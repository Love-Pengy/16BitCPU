----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 11/26/2024 01:31:00 PM
-- Design Name: 
-- Module Name: IFIDBuffer - Behavioral
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

entity IFIDBuffer is


  Port (clk : in std_logic;
        IFIDWrite : in std_logic := '1';
        flush: in std_logic := '1';
        nextIn: in std_logic_vector(15 downto 0); 
        currIn: in std_logic_vector(15 downto 0);
        nextOut: out std_logic_vector(15 downto 0) := (others => '0');
        currOut : out std_logic_vector(15 downto 0) := (others => '0'));
end IFIDBuffer;

architecture Behavioral of IFIDBuffer is

begin

    process(clk)
        variable nextInstruction, currentInstruction : std_logic_vector(15 downto 0); 
    begin
        if(rising_edge(clk)) then 
            if(flush = '1') then 
                currOut <= X"F000";
                nextOut <= nextIn;
            elsif (IFIDWrite = '1') then 
                nextOut <= nextIn; 
                currOut <= currIn; 
            end if;
        end if;
        
--        if(falling_edge(clk)) and (IFIDWrite = '1') then 
--            nextOut <= nextInstruction; 
--            currOut <= currentInstruction; 
--        end if;
    
    
    end process;

end Behavioral;
