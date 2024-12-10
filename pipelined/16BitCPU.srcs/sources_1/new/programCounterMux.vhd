----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 11/27/2024 01:40:14 PM
-- Design Name: 
-- Module Name: programCounterMux - Behavioral
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

entity programCounterMux is
  Port (in1, in2: in std_logic_vector(15 downto 0);
        output: out std_logic_vector(15 downto 0);
        selector: in std_logic;
        exceptionEnable : in std_logic;
        exception: in std_logic_vector(15 downto 0) );
end programCounterMux;

architecture Behavioral of programCounterMux is
begin

process(in1, in2, selector, exception, exceptionEnable)
begin 
    if(exceptionEnable = '1') then
        output <= exception;
    else
        if(selector = '1') then
            output <= in1;
        else
            output <= in2;
        end if;
    end if;
end process;

end Behavioral;
