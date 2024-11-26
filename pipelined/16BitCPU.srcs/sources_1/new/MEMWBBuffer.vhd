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

entity MEMWBBuffer is
  Port (clk : in std_logic;
        dMemReadDataIn, aluResultIn : in std_logic_vector(15 downto 0); 
        rdIn : in std_logic_vector(2 downto 0);
        
        memToRegIn, regWriteIn : in std_logic;
        memToRegOut, regWriteOut : out std_logic; 
        
        dMemReadDataOut, aluResultOut : out std_logic_vector(15 downto 0); 
        rdOut : out std_logic_vector(2 downto 0));
end MEMWBBuffer;

architecture Behavioral of MEMWBBuffer is

begin

    process(clk)
        variable dMemReadData, aluResult : std_logic_vector(15 downto 0);
        variable rd : std_logic_vector(2 downto 0);
        variable memToReg, regWrite : std_logic;
        
    begin
        if(rising_edge(clk)) then 
            dMemReadData := dMemReadDataIn; 
            aluResult := aluResultIn; 
            rd := rdIn;
            
            memToReg := memToRegIn; 
            regWrite := regWriteIn;
            
        elsif(falling_edge(clk)) then 
           dMemReadDataOut <= dMemReadData; 
           aluResultOut <= aluResult; 
           rdOut <= rd;
           
           memToRegOut <= memToReg;
           regWriteOut <= regWrite;
           
        end if;

    end process;

end Behavioral;
