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
  
        regDstIn, jumpIn, branchIn, memReadIn, memToRegIn, ALUOpIn, memWriteIn, ALUSrcIn, regWriteIn : in std_logic; 
        
        regDstOut, jumpOut, branchOut, memReadOut, memToRegOut, ALUOpOut, memWriteOut, ALUSrcOut, regWriteOut : out std_logic; 

        rData1In, rData2In, nextIn, signExtendIn: in std_logic_vector(15 downto 0);
        rtIn, rdIn, rsIn: in std_logic_vector(2 downto 0); 
        
        rData1Out, rData2Out, nextOut : out std_logic_vector(15 downto 0);
        signExtendOut : out std_logic_vector(15 downto 0); 
        rtOut, rdOut, rsOut: out std_logic_vector(2 downto 0));
end IDEXBuffer;

architecture Behavioral of IDEXBuffer is

begin

    process(clk)
        variable readData1, readData2, nextInstruction, signExtender: std_logic_vector(15 downto 0);
        variable regDst, jump, branch, memRead, memToReg, ALUOp, memWrite, ALUSrc, regWrite : std_logic;
        variable rt, rd, rs  : std_logic_vector(2 downto 0);
    begin
        if(rising_edge(clk)) then 
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
            
        elsif(falling_edge(clk)) then 
            rData1Out <= readData1;
            rData2Out <= readData2;
            nextOut <= nextInstruction;
            signExtendOut <= signExtender;
            rtOut <= rt; 
            rdOut <= rd;
            rsOut <= rs;
            
            regDstOut <= regDst; 
            jumpOut <= jump;
            branchOut <= branch; 
            memReadOut <= memRead; 
            memToRegOut <= memToReg; 
            ALUOpOut <= ALUOp; 
            memWriteOut <= memWrite;
            ALUSrcOut <= ALUSrc; 
            regWriteOut <= regWrite; 
            
        end if;

    end process;

end Behavioral;
