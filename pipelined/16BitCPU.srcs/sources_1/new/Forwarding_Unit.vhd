----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 03:04:43 PM
-- Design Name: 
-- Module Name: Forwarding_Unit - Behavioral
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

entity Forwarding_Unit is
  Port (rs, rt, ExMemRd, MemWbRd: in std_logic_vector(2 downto 0);
        ExMemRegwr, MemWbRegwr: in std_logic;
        forward1, forward2: out std_logic_vector(1 downto 0) := (others => '0')
        );
end Forwarding_Unit;

architecture Behavioral of Forwarding_Unit is

begin
    process(rs, rt, ExMemRd, MemWbRd, ExMemRegwr, MemWbRegwr)
        begin
            if (ExMemRegwr = '1') and (ExMemRd /= "000") and (ExMemRd = rs) then
                forward1 <= "10";
            elsif (MemWbRegwr = '1') and (MemWbRd /= "000") and (MemWbRd = rs) then
                forward1 <= "01";
            end if;
            
            if (ExMemRegwr = '1') and (ExMemRd /= "000") and (ExMemRd = rt) then
                forward2 <= "10";
            elsif (MemWbRegwr = '1') and (MemWbRd /= "000") and (MemWbRd = rt) then
                forward2 <= "01";
            end if;
    end process;

end Behavioral;
