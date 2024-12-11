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
        pcWrite: in std_logic;
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


COMPONENT EXMEMBuffer
    Port(clk : in std_logic;
        aluResultIn, dMemWriteDataIn : in std_logic_vector(15 downto 0);
        rdIn : std_logic_vector(2 downto 0);
        memReadIn, memWriteIn, regWriteIn, memToRegIn : in std_logic;
        
        memReadOut, memWriteOut, regWriteOut, memToRegOut : out std_logic;

        aluResultOut, dMemWriteDataOut : out std_logic_vector(15 downto 0);
        rdOut : out std_logic_vector(2 downto 0)); 
end COMPONENT;

COMPONENT Forward_Mux
    Port (readData, aluResult, wrData: in std_logic_vector(15 downto 0);
        fowardSig: in std_logic_vector(1 downto 0);
        output: out std_logic_vector(15 downto 0));
end COMPONENT;


COMPONENT Forwarding_Unit
    Port (rs, rt, ExMemRd, MemWbRd: in std_logic_vector(2 downto 0);
        ExMemRegwr, MemWbRegwr: in std_logic;
        forward1, forward2: out std_logic_vector(1 downto 0) := (others => '0'));
end COMPONENT;
       
COMPONENT  IDEXBuffer 
    Port(clk : in std_logic;
  
        regDstIn, jumpIn, branchIn, memReadIn, memToRegIn, memWriteIn, ALUSrcIn, regWriteIn : in std_logic; 
        ALUOpIn: in std_logic_vector(3 downto 0);
        
        regDstOut, jumpOut, branchOut, memReadOut, memToRegOut, memWriteOut, ALUSrcOut, regWriteOut : out std_logic; 
        ALUOpOut: out std_logic_vector(3 downto 0);
        
        rData1In, rData2In, nextIn, signExtendIn: in std_logic_vector(15 downto 0);
        rtIn, rdIn, rsIn: in std_logic_vector(2 downto 0); 
        
        rData1Out, rData2Out, nextOut : out std_logic_vector(15 downto 0);
        signExtendOut : out std_logic_vector(15 downto 0); 
        rtOut, rdOut, rsOut: out std_logic_vector(2 downto 0));
end COMPONENT;

COMPONENT IFIDBuffer
    Port(clk, IFIDWrite : in std_logic;
        flush: in std_logic;
        nextIn: in std_logic_vector(15 downto 0); 
        currIn: in std_logic_vector(15 downto 0);
        nextOut: out std_logic_vector(15 downto 0) := (others => '0');
        currOut : out std_logic_vector(15 downto 0) := (others => '0'));
end COMPONENT;

COMPONENT MEMWBBuffer 
    Port(clk : in std_logic;
        dMemReadDataIn, aluResultIn : in std_logic_vector(15 downto 0); 
        rdIn : in std_logic_vector(2 downto 0);
        
        memToRegIn, regWriteIn : in std_logic;
        memToRegOut, regWriteOut : out std_logic; 
        
        dMemReadDataOut, aluResultOut : out std_logic_vector(15 downto 0); 
        rdOut : out std_logic_vector(2 downto 0));
end COMPONENT;

COMPONENT Stall_Mux
    Port( regDst, jump, branch, memRead, memToReg, memWrite, ALUSrc, regWrite, stallSig : in std_logic;
        alu_op : in std_logic_vector(3 downto 0);
        regDstOut, jumpOut, branchOut, memReadOut, memToRegOut, memWriteOut, ALUSrcOut, regWriteOut : out std_logic;
        alu_op_out : out std_logic_vector(3 downto 0));
end COMPONENT;

COMPONENT Stalling_Unit
    Port( IdExMemRead: in std_logic;
        IdExRt, IfIdRt, IfIdRs: in std_logic_vector(2 downto 0);
        stall, IfIdWr, pcWr: out std_logic := '1');
end COMPONENT; 

COMPONENT controlUnit
   Port (
        opcode : in std_logic_vector(3 downto 0);
        func: in std_logic_vector(2 downto 0);
        branchSig : in std_logic;
        IFflush : out std_logic := '0';
        alu_op : out std_logic_vector(3 downto 0) := "0000"; 
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

--COMPONENT programCounterMux
--    Port (in1, in2: in std_logic_vector(15 downto 0);
--        output: out std_logic_vector(15 downto 0);
--        selector: in std_logic;
--        exceptionEnable : in std_logic;
--        exception: in std_logic_vector(15 downto 0));
--end COMPONENT;


COMPONENT regComparator
    Port (in1, in2: in std_logic_vector(15 downto 0); 
        output : out std_logic := '0' );
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
FOR ALL: EXMEMBuffer use entity work.EXMEMBuffer(Behavioral);
FOR ALL: Forward_Mux use entity work.Forward_Mux(Behavioral);
FOR ALL: Forwarding_Unit use entity work.Forwarding_Unit(Behavioral);
FOR ALL: IDEXBuffer use entity work.IDEXBuffer(Behavioral);
FOR ALL: IFIDBuffer use entity work.IFIDBuffer(Behavioral);
FOR ALL: MEMWBBuffer use entity work.MEMWBBuffer(Behavioral);
FOR ALL: Stall_Mux use entity work.Stall_Mux(Behavioral);
FOR ALL: Stalling_Unit use entity work.Stalling_Unit(Behavioral);
--FOR ALL: programCounterMux use entity work.ProgramCounterMux(Behavioral);
FOR ALL: regComparator use entity work.regComparator(Behavioral);

signal ccCounter : integer;
-- where to jump if exception happens
constant handler : std_logic_vector(15 downto 0) := X"0000";


signal WBMuxOuput, dataMemReadData, MEMWBDMemReadData, MEMWBALUResult,  ALUOut, ALUIn2,EXMEMWriteData,   EXMEMAddress, branchLeftShifterOutput,pcInput,ALUSrcMuxIn, MEMWBdMemReadDataOut,ALUIn1,  WBMuxOutput, IDEXRData1, IDEXRData2, IDEXNextInstr, IDEXSignExtend,   branchAddressMuxOutput, jumpAddress, readDataOne, readDataTwo, memToRegMuxOutput,  signExtenderOutput, IFIDNextOutput, IFIDCurrOutput, instructionMemOutput, twoAdderOutput, adderOutput, pcOutput, pcMuxOutput : std_logic_vector(15 downto 0);
signal EXMEMMemRead,IDEXMemRead, flush,  MEMWBMemToReg, EXMEMemWrite, EXMEMMemWrite, EXMEMMemToReg, stallMuxBranch,IDEXRegDst, IDEXJump, IDEXBranch, EXMEMRegWrite, MEMWBRegWrite, IDEXMemToReg, IDEXMemWrite, IDEXALUSrc, IDEXRegWrite, stallMuxMemRead, stallMuxMemToReg, stallMuxMemWrite, stallMuxALUSrc, stallMuxRegWrite, regDst, memRead, memToReg, memWrite, ALUSrc, stall, stallMuxRegDst, stallMuxJump, regComparatorOutput, branchAnd,  zero,pcWrite, branch,regWrite,jump,   causeEPCOutput, IFFlush, IFIDWrite: std_logic;
signal regWriteOutput,writeRegMuxOuptut, MEMWBRd, IDEXMemRd,writeRegMuxOutput, EXMEMRd,  IDEXRtOut, IDEXRdOut, IDEXRsOut :  std_logic_vector(2 downto 0);
signal ALUOp, stallMuxALUOp,IDEXALUOp: std_logic_vector(3 downto 0);
signal jumpLeftShifterOutput : std_logic_vector(12 downto 0);
signal ALUMode : std_logic_vector(3 downto 0);
signal fw1, fw2 : std_logic_vector(1 downto 0);
begin 

     programCounterCalc: programCounter
        PORT MAP ( 
            clk => clk,
            enable => clkEnable,
            pcWrite => pcWrite, 
            readAddress => pcInput,
            instruction => pcOutput);
        
      instructionMemCalc: instructionMemory
        PORT MAP (
            clk => clk,
            readAddr => pcOutput,
            instruction => instructionMemOutput);
        
     twoAdderCalc: twoAdder
        PORT MAP (
            BUSA => pcOutput,
    	    RESULT => twoAdderOutput,
    	    COUT => open);
    
     jumpShiftCalc: jumpLeftShifter
        PORT MAP (input => IFIDCurrOutput(11 downto 0), 
                  output => jumpLeftShifterOutput);
                  
     jumpAddress(12 downto 0) <= jumpLeftShifterOutput; 
     jumpAddress(15 downto 13) <= IFIDCurrOutput(15 downto 13); 
     
     IFIDCalc: IFIDBuffer
        PORT MAP (
            clk => clk,
            flush => flush, 
            IFIDWrite => IFIDWrite,
            nextIn => twoAdderOutput,  
            currIn => instructionMemOutput, 
            nextOut => IFIDNextOutput, 
            currOut => IFIDCurrOutput);

     signExtendCalc: signExtender
        PORT MAP(SigIn => IFIDCurrOutput(5 downto 0), 
                 SigOut => signExtenderOutput
                 );
     
     branchLeftShifterCalc: branchLeftShifter
        PORT MAP (input => signExtenderOutput, 
                  output => branchLeftShifterOutput);
     
     adderCalc: adder
        PORT MAP (BUSA  => signExtenderOutput,
              BUSB   => IFIDNextOutput,
              RESULT  => adderOutput,
              COUT   => open);
     
     branchAnd <= branch AND zero; 
     
     branchMuxCalc: sixteenBitMux
        PORT MAP(cntrl => branchAnd, topin => adderOutput, bottom => twoAdderOutput,  output => branchAddressMuxOutput); 
        
     jumpMuxCalc: sixteenBitMux
        PORT MAP(cntrl => jump, topin => jumpAddress, bottom => branchAddressMuxOutput, output => pcInput);
     
     controlUnitCalc: controlUnit
         PORT MAP (
            opcode => IFIDCurrOutput(15 downto 12),
            func => IFIDCurrOutput(2 downto 0),
            branchSig => regComparatorOutput, 
            IFflush => flush, 
            alu_op => ALUOp, 
            reg_dst => regDst,                   
            reg_write => regWrite, 
            alu_src => ALUSrc, 
            mem_read => memRead, 
            mem_write => memWrite,                  
            mem_to_reg => memToReg, 
            jump => jump, 
            branch => branch);
        
       stallingUnitCalc: stalling_unit
            PORT MAP( IdExMemRead => IDEXMemRead, 
                IdExRt => IDEXRtOut, 
                IfIdRt => IFIDCurrOutput(8 downto 6), 
                IfIdRs => IFIDCurrOutput(11 downto 9), 
                stall => stall, 
                IfIdWr => IFIDWrite, 
                pcWr => PCWrite);
            
     registerCalc: registers
        PORT MAP (
            clk  => clk, 
            read1 => IFIDCurrOutput(11 downto 9), 
            read2 => IFIDCurrOutput(8 downto 6),  
            writeReg =>  EXMEMRd,  
            registersWrite => regWrite, 
            writeData => WBMuxOutput, 
            data1 => readDataOne, 
            data2 =>  readDataTwo);
                 
     regComaratorCalc: regComparator
        PORT MAP (in1 => readDataOne, 
                  in2 => readDataTwo,  
                  output => regComparatorOutput);
                 
     IDEXControlSignalMux: Stall_Mux
       PORT MAP( regDst => regDst, 
             jump =>  jump,
             branch => branch,
             memRead => memRead, 
             memToReg => memToReg, 
             memWrite => memWrite, 
             ALUSrc => ALUSrc, 
             regWrite => regWrite, 
             stallSig => stall, 
             alu_op => aluOp,
             regDstOut => stallMuxRegDst, 
             jumpOut => stallMuxJump, 
             branchOut => stallMuxBranch, 
             memReadOut => stallMuxMemRead, 
             memToRegOut => stallMuxMemToReg, 
             memWriteOut => stallMuxMemWrite, 
             ALUSrcOut => stallMuxALUSrc, 
             regWriteOut => stallMuxRegWrite, 
             alu_op_out => stallMuxALUOp);
     
     IDEXBufferCalc: IDEXBuffer
       PORT MAP(clk => clk, 
  
                regDstIn => stallMuxRegDst, 
                jumpIn => stallMuxJump, 
                branchIn => stallMuxBranch, 
                memReadIn => stallMuxMemRead, 
                memToRegIn => stallMuxMemToReg, 
                memWriteIn => stallMuxMemWrite, 
                ALUSrcIn => stallMuxALUSrc, 
                regWriteIn => stallMuxRegWrite, 
                ALUOpIn => stallMuxAluOp, 
                
                regDstOut => IDEXRegDst,  
                jumpOut => IDEXJump, 
                branchOut => IDEXBranch, 
                memReadOut => IDEXMemRead, 
                memToRegOut => IDEXMemToReg, 
                memWriteOut => IDEXMemWrite, 
                ALUSrcOut => IDEXALUSrc, 
                regWriteOut => IDEXRegWrite,  
                ALUOpOut => IDEXALUOp,
                
                rData1In => readDataOne,  
                rData2In => readDataTwo, 
                nextIn => IFIDNextOutput, 
                signExtendIn => signExtenderOutput, 
                rtIn => IFIDCurrOutput(8 downto 6), 
                rdIn => IFIDCurrOutput(5 downto 3), 
                rsIn => IFIDCurrOutput(11 downto 9), 
                
                rData1Out => IDEXRData1,  
                rData2Out => IDEXRData2, 
                nextOut => IDEXNextInstr,
                signExtendOut => IDEXSignExtend,  
                rtOut => IDEXRtOut, 
                rdOut => IDEXRdOut, 
                rsOut => IDEXRsOut);
        
        forwardMux1Calc: forward_mux
             PORT MAP (readData => IDEXRData1, 
                   aluResult => EXMEMAddress, 
                   wrData => WBMuxOutput, 
                   fowardSig => fw1, 
                   output => ALUIn1);
                   
        forwardMux2Calc: forward_mux
         PORT MAP (readData => IDEXRData2, 
               aluResult => EXMEMAddress, 
               wrData => WBMuxOutput, 
               fowardSig => fw2, 
               output => aluSrcMuxIn);   
                       
         aluSrcMuxCalc: sixteenBitMux
            PORT MAP(cntrl => IDEXALUSrc, bottom => ALUSrcMuxIn, topin => IDEXSignExtend, output => ALUIn2);
          
          aluCalc: ALU
            PORT MAP (
                 A => ALUIn1, 
                 B => ALUIn2, 
                 C => ALUOut, 
                 Mode => ALUOp, 
                 Zero => Zero
                );
            
            
          writeRegMux: threeBitMux
             PORT MAP (
                cntrl => IDEXRegDst, 
                topin => IDEXRdOut, 
                bottom => IDEXRtOut, 
                output => writeRegMuxOutput);
                
          
           forwardUnitCalc: forwarding_unit
             PORT MAP (rs => IDEXRsOut, 
                       rt => IDEXRtOut, 
                       ExMemRd => EXMEMRd, 
                       MemWbRd => MEMWBRd,
                       ExMemRegwr => EXMEMRegWrite, 
                       MemWbRegwr => MEMWBRegWrite,
                       forward1 => fw1, 
                       forward2 => fw2);
                       
                       
          EXMemCalc: EXMEMBuffer
             PORT MAP(clk => clk, 
                        aluResultIn => ALUOut, 
                        dMemWriteDataIn => ALUSrcMuxIn, 
                        rdIn => writeRegMuxOutput, 
                        memReadIn => IDEXMemRead,
                        memWriteIn => IDEXMemWrite, 
                        regWriteIn => IDEXRegWrite, 
                        memToRegIn => IDEXMemToReg, 
                        
                        memReadOut => EXMEMMemRead, 
                        memWriteOut => EXMEMemWrite, 
                        regWriteOut => EXMEMRegWrite,
                        memToRegOut => EXMEMMemToReg, 
                
                        aluResultOut => EXMEMAddress, 
                        dMemWriteDataOut => EXMEMWriteData, 
                        rdOut => EXMEMRd);
               
           dataMemoryCalc: dataMemory    
               PORT MAP (address => EXMEMAddress, 
                    writeData => EXMEMWriteData, 
                    clk => clk, 
                    memRead => EXMEMMemRead, 
                    memWrite => EXMEMemWrite, 
                    ReadData => dataMemReadData);
                    
                
           MEMWBBufferCalc: MEMWBBuffer
             PORT MAP(clk => clk, 
                dMemReadDataIn => dataMemReadData, 
                aluResultIn => EXMEMAddress, 
                rdIn => EXMEMRd,
                memToRegIn => EXMEMMemToReg, 
                regWriteIn => EXMEMRegWrite,
                memToRegOut => MEMWBMemToReg,
                regWriteOut => MEMWBRegWrite, 
                
                dMemReadDataOut => MEMWBDMemReadData, 
                aluResultOut => MEMWBALUResult,  
                rdOut => MEMWBRd);
                
                
             WBMuxCalc: sixteenBitMux
                PORT MAP(cntrl => MEMWBMemToReg, topin => MEMWBDMemReadData, bottom => MEMWBALUResult, output => WBMuxOutput); 
                
     process(clk, clkEnable, reset)
     begin
        if(reset = '1') then 
            ccCounter <= 0;
        elsif(rising_edge(clk) AND (clkEnable = '1')) then
            ccCounter <= ccCounter + 1;
        end if;
     end process;
     
end Structural;
