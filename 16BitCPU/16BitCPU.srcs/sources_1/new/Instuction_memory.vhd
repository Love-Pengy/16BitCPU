----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2024 12:49:13 PM
-- Design Name: 
-- Module Name: Instuction_memory - Behavioral
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

entity instruction_memory is
    Port ( clk       : in  std_logic; 
           pc        : in  std_logic_vector(15 downto 0); -- 16-bit PC input
           instruction : out std_logic_vector(15 downto 0)  -- 16-bit instruction output
         );
end instruction_memory;

architecture Behavioral of instruction_memory is
    type memory_array is array (0 to 23) of std_logic_vector(15 downto 0);
    signal im : memory_array := (
        -- Example program: You can fill in real machine code here
        0 => X"0298",  -- Sample instruction 1
        1 => X"1123",  -- Sample instruction 2
        2 => X"0299",
        3 => X"2123",
        4 => X"029A",
        5 => X"3123", -- Sample instruction 3
        -- Add more instructions as needed
        others => (others => '0')  -- Default fill with zeros
    );

begin
    process(clk, pc)
    begin
        if rising_edge(clk) then
            instruction <= im(to_integer(unsigned(pc)));  -- PC is used as address
        end if;
    end process;

end Behavioral;
