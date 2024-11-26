----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 04:04:31 PM
-- Design Name: 
-- Module Name: Stalling_Unit - Behavioral
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

entity Stalling_Unit is
  Port (IdExMemRead: in std_logic;
        IdExRt, IfIdRt, IfIdRs: in std_logic_vector(2 downto 0);
        stall, IfIdWr, pcWr: out std_logic := '1');
end Stalling_Unit;

architecture Behavioral of Stalling_Unit is

begin
    process(IdExMemRead, IdExRt, IfIdRt, IfIdRs)
        begin
            if ((IdExMemRead = '1') and ((IdExRt = IfIdRs) or (IdExRt = IfIdRt))) then
                stall <= '0';
                IfIdWr <= '0';
                pcWr <= '0';
            end if;
    end process;

end Behavioral;
