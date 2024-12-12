----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 11/04/2024 11:35:50 AM
-- Design Name: 
-- Module Name: sevenSegmentDriver - Behavioral
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

entity sevenSegmentDriver is
  Port (clk: in std_logic;
        reset: in std_logic;
        input: in std_logic_vector(15 downto 0);
        anOutput: out std_logic_vector(7 downto 0) := (others => '1');
        dpOutput: out std_logic := '1';
        cOutput: out std_logic_vector(6 downto 0) := (others => '1'));
end sevenSegmentDriver;

architecture Behavioral of sevenSegmentDriver is
signal currVal : std_logic_vector(3 downto 0);
type swType is array (0 to 3) of std_logic_vector(3 downto 0);
signal swMap : swType := (others=>(others=>'0'));
begin

    
    process(clk, reset)
    variable count : integer := 0; 
    begin   
        swMap(3) <= input(3 downto 0);
        swMap(0) <= input(7 downto 4);
        swMap(1) <= input(11 downto 8);
        swMap(2) <= input(15 downto 12);
        
        if(reset = '1') then 
            dpOutput <= '1';
            anOutput <= (others => '1');
            cOutput <= (others => '1');
            
        elsif(rising_edge(clk)) then
            
            currVal <= swMap(count);
            
            if(count = 2) then
                dpOutput <= '0'; 
            else 
                dpOutput <= '1';
            end if;
            
            anOutput <= "11111111";
            anOutput(count) <= '0';
            --anOutput <= (count => '0', others => '1');
            case to_integer(unsigned(currVal)) is
                when 0 =>
                    cOutput <= "0000001";
                when 1 => 
                    cOutput <= "1001111"; 
                when 2 => 
                    cOutput <= "0010010";
                when 3 => 
                    cOutput <= "0000110";
                when 4 => 
                    cOutput <= "1001100";
                when 5 => 
                    cOutput <= "0100100";
                when 6 =>
                    cOutput <= "0100000";
                when 7 => 
                    cOutput <= "0001111";
                when 8 =>
                    cOutput <= "0000000";
                when 9 => 
                    cOutput <= "0000100";
                when 10 => 
                    cOutput <= "0001000";
                when 11 => 
                    cOutput <= "1100000"; 
                when 12 => 
                    cOutput <= "0110001";
                when 13 => 
                    cOutput <= "1000010";
                when 14 => 
                    cOutput <= "0110000";
                when 15 => 
                    cOutput <= "0111000";
                when others => 
                    cOutput <= "1111111";      
            end case;
            count := count + 1;
            if(count = 4) then 
                count := 0;
            end if;
        end if; 
    end process;
end Behavioral;