----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 02:18:16 PM
-- Design Name: 
-- Module Name: adder2 - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder2 is
      Port (BUSA   : in std_logic_vector(15 downto 0);
    	    RESULT : out std_logic_vector(15 downto 0);
    	    COUT   : out std_logic := '0' );
end adder2;

architecture Behavioral of adder2 is
    signal A: unsigned(16 downto 0) := (others => '0');
    signal B: unsigned(16 downto 0) := "00000000000000010";
    signal output: unsigned(16 downto 0);
begin
    process(BUSA)
        begin
            A(15 downto 0)  <= unsigned(BUSA);
            output <= A + B;
            
            RESULT <= std_logic_vector(output(15 downto 0));
            COUT <= output(16);
    end process;

end Behavioral;
