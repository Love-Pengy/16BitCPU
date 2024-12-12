----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:51:54 03/09/2016 
-- Design Name: 
-- Module Name:    divider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.std_logic_1164.all;

ENTITY SSegClockDivider is
-- use these values for simulation -----
-- GENERIC(DIVISOR : positive := 2);
----------------------------------------
-- use these values for synthesis ------
   GENERIC(DIVISOR : positive := 250000);
-----------------------------------------
  PORT(mclk : IN  std_logic;
       sclk : OUT std_logic);
END SSegClockDivider;

ARCHITECTURE behavioral OF SSegClockDivider IS

	SIGNAL sclki : std_logic := '0';
  
  BEGIN

    div_clk : PROCESS(mclk)
    
      VARIABLE count : integer RANGE 0 to DIVISOR/2 := 0;

      BEGIN
        IF(rising_edge(mclk)) THEN
          IF(count = (DIVISOR/2)-1) THEN
            sclki <= not sclki;
            count := 0;
          ELSE
            count := count + 1;
          END IF;
        END IF;
    END PROCESS div_clk;

    sclk <= sclki;
	 
END behavioral;


