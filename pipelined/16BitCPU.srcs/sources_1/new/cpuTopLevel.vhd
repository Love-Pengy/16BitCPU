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
  Port (clk: in std_logic := '0';
        clkEnable: in std_logic := '0';
        reset: in std_logic := '0'); 
end cpuTopLevel;

architecture Structural of cpuTopLevel is
COMPONENT programCounter 
    PORT ( 
        clk : in std_logic;
        enable: in std_logic;
        readAddress: in std_logic_vector(15 downto 0);
        instruction: out std_logic_vector(15 downto 0));
end COMPONENT;

COMPONENT instructionMemory 
    PORT (
        clk: in std_logic;
        readAddr: in std_logic_vector(15 downto 0);
        instruction: out std_logic_vector(15 downto 0));
end COMPONENT;

COMPONENT SixteenBitMux
    generic(N : integer := 16);
    PORT (
        cntrl : in std_logic;
        topin : in std_logic_vector(N-1 downto 0);
        bottom : in std_logic_vector(N-1 downto 0);
        output : out std_logic_vector(N-1 downto 0));
END COMPONENT;

COMPONENT ThreeBitMux
    generic(N : integer := 3);
    PORT (
        cntrl : in std_logic;
        topin : in std_logic_vector(N-1 downto 0);
        bottom : in std_logic_vector(N-1 downto 0);
        output : out std_logic_vector(N-1 downto 0));
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
        alu_op : out std_logic_vector(3 downto 0); 
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
     Port (SigIn : in std_logic_vector(5 downto 0);
        SigOut : out std_logic_vector(15 downto 0)
      );
end COMPONENT;

COMPONENT aluControlUnit
    Port (
        --check the bit width of this
        ALUOp: in std_logic_vector(3 downto 0); 
        func: in std_logic_vector(2 downto 0);
        output: out std_logic_vector(3 downto 0));
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

COMPONENT twoAdder
      Port (BUSA   : in std_logic_vector(15 downto 0);
    	    RESULT : out std_logic_vector(15 downto 0);
    	    COUT   : out std_logic);
end COMPONENT;

COMPONENT branchLeftShifter
    Port (input: in std_logic_vector(15 downto 0);
        output: out std_logic_vector(15 downto 0));
end COMPONENT;

COMPONENT jumpLeftShifter
    Port (input: in std_logic_vector(11 downto 0);
        output: out std_logic_vector(12 downto 0));
end COMPONENT;

COMPONENT adder 
     Port (BUSA   : in std_logic_vector(15 downto 0);
    	BUSB   : in std_logic_vector(15 downto 0);
    	RESULT : out std_logic_vector(15 downto 0);
    	COUT   : out std_logic);
end COMPONENT;

FOR ALL: adder use entity work.adder(Behavioral);
FOR ALL: jumpLeftShifter use entity work.jumpLeftShifter(Behavioral);
FOR ALL: branchLeftShifter use entity work.branchLeftShifter(Behavioral);
FOR ALL: twoAdder use entity work.adder2(Behavioral);
FOR ALL: dataMemory use entity work.Data_Memory(Behavioral);
FOR ALL: alu use entity work.ALU(Behavioral);
FOR ALL: aluControlUnit use entity work.aluControl(Behavioral);
FOR ALL: signExtender use entity work.Sign_Extend(Behavioral);
FOR ALL: controlUnit use entity work.Control_Unit(Behavioral);
FOR ALL: registers use entity work.registers(Behavioral);
FOR ALL: sixteenBitMux use entity work.Mux(Behavioral);
FOR ALL: threeBitMux use entity work.Mux(Behavioral);
FOR ALL: instructionMemory use entity work.instructionMemory(Behavioral);
FOR ALL: programCounter use entity work.programCounter(Behavioral);


signal pcInput, pcOutput, jumpAddress, branchAddressShifterOutput, branchAddressMuxOutput, instructionMemoryOutput, branchAddress, signExtendOutput, registerOutOne, registerOutTwo, ALUResult, dataMemoryOutput, memToRegMuxOutput, ALUSrcMuxOutput, twoAdderOutput: std_logic_vector(15 downto 0);
signal ALUControlUnitOutput, ALUOp_sig: std_logic_vector(3 downto 0);
signal jumpAddressShifterOutput : std_logic_vector(12 downto 0);
signal regDstMuxOutput : std_logic_vector(2 downto 0);
signal regDest_sig, jump_sig, branch_sig, memRead_sig, memToReg_sig, memWrite_sig, ALUSrc_sig, regWrite_sig, ALUZero, branchAnd: std_logic;
signal ccCounter : integer;
begin
    
    programCounterCalc: programCounter
        PORT MAP(clk => clk, readAddress => pcInput, instruction => pcOutput, enable => clkEnable);
    instructionMemoryCalc: instructionMemory
        PORT MAP(clk => clk, readAddr => pcOutput, instruction => instructionMemoryOutput);
    controlUnitCalc: controlUnit
        PORT MAP(opcode => instructionMemoryOutput(15 downto 12), reg_dst => regDest_sig, jump => jump_sig, branch => branch_sig, mem_read => memRead_sig, mem_to_reg => memToReg_sig, ALU_Op => ALUOp_sig, mem_write => memWrite_sig, ALU_src => ALUSrc_sig, reg_write => regWrite_sig);
    regDstMuxCalc: threeBitMux
        PORT MAP(cntrl => regDest_sig, bottom => instructionMemoryOutput(8 downto 6), topin => instructionMemoryOutput(5 downto 3), output => regDstMuxOutput);
    registerFileCalc: registers
        PORT MAP(clk => clk, read1 => instructionMemoryOutput(11 downto 9), read2 => instructionMemoryOutput(8 downto 6), writeReg => regDstMuxOutput, registersWrite => regWrite_sig, writeData => memToRegMuxOutput, data1 => registerOutOne, data2 => registerOutTwo);
    signExtendCalc: signExtender
        PORT MAP(SigIn => instructionMemoryOutput(5 downto 0), SigOut => signExtendOutput);
    ALUSrcMuxCalc : sixteenBitMux
        PORT MAP(cntrl => ALUSrc_sig, bottom => registerOutTwo, topin => signExtendOutput, output => ALUSrcMuxOutput);
    ALUCalc : ALU
        PORT MAP(A => registerOutOne, B => ALUSrcMuxOutput, Mode => ALUControlUnitOutput, Zero => ALUZero, C => ALUResult);
        
    branchAnd <= branch_sig AND ALUZero;
    
    ALUControlUnitCalc : ALUControlUnit
        PORT MAP(ALUOp => ALUOp_sig, func => instructionMemoryOutput(2 downto 0),  output => ALUControlUnitOutput);
    dataMemoryCalc: dataMemory
        PORT MAP(clk => clk, address => ALUResult, writeData => registerOutTwo, memWrite => memWrite_sig, memRead => memRead_sig, ReadData => dataMemoryOutput);
    memToRegMuxCalc: sixteenBitMux
        PORT MAP(cntrl => memToReg_sig, topin => dataMemoryOutput, bottom => ALUResult, output => memToRegMuxOutput);
    
    -- full jump address is (program counter + 2)(15 downto 14) + (immediate << 1)(13 downto 0)
     twoAdderCalc: twoAdder
        PORT MAP(BUSA => pcOutput, RESULT => twoAdderOutput, COUT => open);
     jumpAddressCalc: jumpLeftShifter
        PORT MAP(input => instructionMemoryOutput(11 downto 0), output => jumpAddressShifterOutput);
     
     jumpAddress(12 downto 0) <= jumpAddressShifterOutput(12 downto 0);
     jumpAddress(15 downto 13) <= twoAdderOutput(15 downto 13);
     
     branchAddressShifterCalc: branchLeftShifter
        PORT MAP(input => signExtendOutput, output => branchAddressShifterOutput);
     branchAddressAdderCalc: adder
        PORT MAP(BUSA => twoAdderOutput, BUSB => branchAddressShifterOutput, RESULT => branchAddress, COUT => open);
     branchMuxCalc : sixteenBitMux
        PORT MAP(cntrl => branchAnd, topin => branchAddress, bottom => twoAdderOutput, output => branchAddressMuxOutput);
     jumpMuxCalc : sixteenBitMux
        PORT MAP(cntrl => jump_sig, topin => jumpAddress, bottom => branchAddressMuxOutput, output => pcInput);
        
     -- counter process
     process(clk, clkEnable, reset)
     begin
        if(reset = '1') then 
            ccCounter <= 0;
        elsif(rising_edge(clk) AND (clkEnable = '1')) then
            ccCounter <= ccCounter + 1;
        end if;
     end process;
     
end Structural;
