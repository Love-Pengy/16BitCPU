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

entity IDEXBuffer is
  Port (clk : in std_logic;
  
        regDstIn, jumpIn, branchIn, memReadIn, memToRegIn, memWriteIn, ALUSrcIn, regWriteIn : in std_logic; 
        ALUOpIn: in std_logic_vector(3 downto 0);
        
        regDstOut, jumpOut, branchOut, memReadOut, memToRegOut, memWriteOut, ALUSrcOut, regWriteOut : out std_logic; 
        ALUOpOut: out std_logic_vector(3 downto 0);
        
        rData1In, rData2In, nextIn, signExtendIn: in std_logic_vector(15 downto 0);
        rtIn, rdIn, rsIn: in std_logic_vector(2 downto 0); 
        
        rData1Out, rData2Out, nextOut : out std_logic_vector(15 downto 0);
        signExtendOut : out std_logic_vector(15 downto 0); 
        rtOut, rdOut, rsOut: out std_logic_vector(2 downto 0));
end IDEXBuffer;

architecture Behavioral of IDEXBuffer is

begin

    process(clk, regDstIn, jumpIn, branchIn, memReadIn, memToRegIn, memWriteIn, ALUSrcIn, regWriteIn, rData1In, rData2In, nextIn, signExtendIn, rtIn, rdIn, rsIn, ALUOpIn)
        variable readData1, readData2, nextInstruction, signExtender: std_logic_vector(15 downto 0);
        variable regDst, jump, branch, memRead, memToReg, memWrite, ALUSrc, regWrite : std_logic;
        variable ALUOp : std_logic_vector(3 downto 0);
        variable rt, rd, rs  : std_logic_vector(2 downto 0);
    begin
        --if(rising_edge(clk)) then 
            readData1 := rData1In; 
            readData2 := rData2In; 
            nextInstruction := nextIn;
            signExtender := signExtendIn; 
            rt := rtIn; 
            rd := rdIn;
            rs := rsIn; 
            
            regDst := regDstIn; 
            jump := jumpIn; 
            branch := branchIn; 
            memRead := memReadIn; 
            memToReg := memToRegIn; 
            ALUOp := ALUOpIn; 
            memWrite := memWriteIn; 
            ALUSrc := ALUSrcIn; 
            regWrite := regWriteIn;
            
        if(rising_edge(clk)) then 
            rData1Out <= rData1In;
            rData2Out <= rData2In;
            nextOut <= nextIn;
            signExtendOut <= signExtendIn;
            rtOut <= rtIn; 
            rdOut <= rdIn;
            rsOut <= rsIn;
            
            regDstOut <= regDstIn; 
            jumpOut <= jumpIn;
            branchOut <= branchIn; 
            memReadOut <= memReadIn; 
            memToRegOut <= memToRegIn; 
            ALUOpOut <= ALUOpIn; 
            memWriteOut <= memWriteIn;
            ALUSrcOut <= ALUSrcIn; 
            regWriteOut <= regWriteIn; 
            
        end if;

    end process;

end Behavioral;
