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

entity EXMEMBuffer is
  Port (clk : in std_logic;
        branchAddrIn, aluResultIn, dMemWriteDataIn : in std_logic_vector(15 downto 0);
        zeroIn : in std_logic; 
        rdIn : std_logic_vector(2 downto 0);
        jumpIn, branchIn, memReadIn, memWriteIn, regWriteIn, memToRegIn : in std_logic;
        
        jumpOut, branchOut, memReadOut, memWriteOut, regWriteOut, memToRegOut : out std_logic;

        branchAddrOut, aluResultOut, dMemWriteDataOut : out std_logic_vector(15 downto 0);
        zeroOut : out std_logic; 
        rdOut : out std_logic_vector(2 downto 0));
end EXMEMBuffer;

architecture Behavioral of EXMEMBuffer is

begin

    process(clk)
        variable branchAddress, aluResult, dMemWriteData : std_logic_vector(15 downto 0);
        variable zero : std_logic; 
        variable rd : std_logic_vector(2 downto 0);
        variable jump, branch, memRead, memWrite, regWrite, memToReg : std_logic; 
    begin
        if(rising_edge(clk)) then 
            branchAddress := branchAddrIn; 
            aluResult := aluResultIn; 
            dMemWriteData := dMemWriteDataIn; 
            zero := zeroIn; 
            rd := rdIn;
            
            jump := jumpIn; 
            branch := branchIn; 
            memRead := memReadIn; 
            memWrite := memWriteIn; 
            regWrite := regWriteIn; 
            memToReg := memToRegIn; 
            
        elsif(falling_edge(clk)) then 
           branchAddrOut <= branchAddress; 
           aluResultOut <= aluResult; 
           dMemWriteDataOut <= dMemWriteData; 
           zeroOut <= zero; 
           rdOut <= rd;
           
           jumpOut <= jump; 
           brnachOut <= branch; 
           memReadOut <= memRead; 
           memWriteOut <= memWrite; 
           regWriteOut <= regWrite; 
           memToRegOut <= memToReg;
        end if;

    end process;

end Behavioral;
