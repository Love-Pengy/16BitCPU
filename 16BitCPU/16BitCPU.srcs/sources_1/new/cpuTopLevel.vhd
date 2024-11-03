----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 11/03/2024 06:00:19 PM
-- Design Name: 
-- Module Name: cpuTopLevel - Behavioral
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


entity cpuTopLevel is
--  Port ( );
end cpuTopLevel;

architecture Structural of cpuTopLevel is
COMPONENT programcounter 
    PORT ( 
        clk : in std_logic;
        readAddress: in std_logic_vector(15 downto 0);
        instruction: out std_logic_vector(15 downto 0));
end COMPONENT;

COMPONENT instructionMemory 
    PORT (
        clk: in std_logic;
        readAddr: in std_logic_vector(15 downto 0);
        instruction: out std_logic_vector(15 downto 0));
end COMPONENT;

COMPONENT mux
    PORT (
        cntrl : in std_logic;
        topin : in std_logic_vector(15 downto 0);
        bottom : in std_logic_vector(15 downto 0);
        output : out std_logic_vector(15 downto 0));
END COMPONENT;

COMPONENT registers
    PORT (
        clk : in std_logic;
        read1, read2, writeReg: in std_logic_vector(2 downto 0); 
        registersWrite: in std_logic;
        writeData: in std_logic_vector(15 downto 0);
        data1, data2: out std_logic_vector(15 downto 0));
end COMPONENT;

COMPONENT controlUnit
    Port (
        opcode : in std_logic_vector(3 downto 0);  
        alu_op : out std_logic := '0'; 
        reg_dst : out std_logic := '0';                   
        reg_write : out std_logic := '0';                 
        alu_src : out std_logic := '0';                   
        mem_read : out std_logic := '0';                  
        mem_write : out std_logic := '0';                 
        mem_to_reg : out std_logic := '0';                 
        jump : out std_logic := '0';
        branch : out std_logic := '0'
    );
end COMPONENT;

COMPONENT signExtender
     Port (SigIn : in std_logic_vector(7 downto 0);
        SigOut : out std_logic_vector(15 downto 0)
      );
end COMPONENT;

COMPONENT aluControlUnit
    Port (
        --check the bit width of this
        ALUOp: in std_logic; 
        opCode: in std_logic_vector(2 downto 0);
        output: out std_logic_vector(2 downto 0));
end COMPONENT;

COMPONENT alu
    generic(N : integer := 16);
    port(
         -- in 1
         A: in std_logic_vector(N-1 downto 0);
         -- in 2
         B: in std_logic_vector(N-1 downto 0);
         -- result
         C: out std_logic_vector(N-1 downto 0);
         -- 0000 Addition 
         -- 0001 Subtraction
         -- 0010 Bitwise AND
         -- 0011 Bitwise OR
         -- 0100 sgt 
         -- 0101 slt
         -- 0110 XOR
         -- 0111 NAND
         -- 1000 XNOR
         -- 1001 CUTL
         -- 1010 CUTU
         -- 1011 SLL
         -- 1100 SRL

        Mode: in std_logic_vector(3 downto 0);
        -- Output Flags
        Zero: out std_logic
        );
end COMPONENT;

COMPONENT dataMemory
       Port (address : in std_logic_vector(15 downto 0);
        writeData : in std_logic_vector(15 downto 0);
        clk : in std_logic;
        memRead : in std_logic;
        memWrite: in std_logic;
        ReadData : out std_logic_vector(15 downto 0)
  );
end COMPONENT; 

-- verify this is the one he was trying to add 4 with
COMPONENT fourAdder
      Port (BUSA   : in std_logic_vector(15 downto 0);
    	    RESULT : out std_logic_vector(15 downto 0);
    	    COUT   : out std_logic);
end COMPONENT;

COMPONENT shiftLeftTwo
    Port (input: in std_logic_vector(11 downto 0);
        output: out std_logic_vector(15 downto 0));
end COMPONENT;

COMPONENT adder 
     Port (BUSA   : in std_logic_vector(15 downto 0);
    	BUSB   : in std_logic_vector(15 downto 0);
    	RESULT : out std_logic_vector(15 downto 0);
    	COUT   : out std_logic);
end COMPONENT;

FOR ALL: adder use entity work.adder(Behavioral);
FOR ALL: shiftLeftTwo use entity work.shiftLeft2(Behavioral);
FOR ALL: fourAdder use entity work.adder2(Behavioral);
FOR ALL: dataMemory use entity work.Data_Memory(Behavioral);
FOR ALL: alu use entity work.ALU(Behavioral);
FOR ALL: aluControlUnit use entity work.aluControl(Behavioral);
FOR ALL: signExtender use entity work.Sign_Extend(Behavioral);
FOR ALL: controlUnit use entity work.Control_Unit(Behavioral);
FOR ALL: registers use entity work.registers(Behavioral);
FOR ALL: mux use entity work.Mux(Behavioral);
FOR ALL: instructionMemory use entity work.instructionMemory(Behavioral);
FOR ALL: programCounter use entity work.programCounter(Behavioral);


signal pcInput, pcOutput, instructionMemoryOutput, signExtendOutput, registerOutOne, registerOutTwo, ALUZero, ALUResult, dataMemoryOutput, memToRegMuxOutput, ALUSrcMuxOutput, regDstMuxOutput, jumpAddressOutput, fourAdderOutput, signExtendShiftOutput, adderOutput, branchMuxOutput, jumpMuxOutput: std_logic_vector(15 downto 0);

begin

end Structural;
