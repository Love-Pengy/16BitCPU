----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 10/23/2024 05:38:06 PM
-- Design Name: 
-- Module Name: instructionMemory - Behavioral
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
use IEEE.std_logic_arith; 
use IEEE.numeric_std.ALL;
entity instructionMemory is
  Port (clk: in std_logic;
        readAddr: in std_logic_vector(15 downto 0);
        instruction: out std_logic_vector(15 downto 0) := (others => '0'));
end instructionMemory;

architecture Behavioral of instructionMemory is
type instructionArray is array (0 to 65536) of std_logic_vector(15 downto 0);

--signal instructionVals : instructionArray := (others => (others => '0'));

--signal instructionVals : instructionArray := (
--    -- remember 
--    --Rtype: opcode rs rt rd func
--    -- itype: opcode rs rt (dest) imm
--    -- jtype: opdcode address
--    -- sw: opcode dest val imm
    
----    -- addi 
----    0 => X"1041", -- addi $1, $zero, 1; 
----    1 => X"107F", -- addi $1, $zero, 111111; 0001 000 001 111111 -- put -1 into register
----    -- add
----    2 => X"0248", -- add $1, $1, $1; 0000 001 001 001 000 -- add -1 to -1 
----    3 => X"0250", -- add $2, $1, $1; 0000 001 001 010 000 -- add -2 to -2 
----    4 => X"0298", -- add $3, $1, $2; 0000 001 010 011 000 -- add -2 to -4 
----    -- sub 
----    5 => X"02A1", -- sub $4, $1, $2; 0000 001 010 100 001 -- sub -2 and -4
----    6 => X"0869", -- sub $5, $4, $1; 0000 100 001 101 001 -- sub 2 and -2
----    -- cutl
----    7 => X"1DBF", -- addi $6, $6, 111111; 0001 110 110 111111 -- put -1 into register
----    8 => X"4C82", -- cutl $6, $6, 2; 0100 110 110 000010 -- cutl 111111 by 2
----    -- cutu
----    9 => X"1FFF", -- addi $7, $7, 111111; 0001 111 111 111111 -- put -1 into register
----    10 => X"5FC2", -- cutu $7, $7, 2; 0101 111 111 000010
----    -- subi 
----    11 => X"9022", -- subi $1, $zero, 2; 1001 000 001 000010 -- put -2 in reg 1
----    12 => X"927E", -- subi $1, $1, -2; 1001 001 001 111110 -- reset reg 1 to zero 
----    -- nandi 
----    13 => X"10B3", -- addi $2, $zero, 110011; 0001 000 010 110011 -- put 110011 into reg 2
----    14 => X"A4BF", -- nandi $2, $2, 111111; 1010 010 010 111111
----    -- jump
----    --15 => X"6000", -- jump 0; 0110 000000000000
----    --15 => X"6002", -- jump 2; 0110 000000000010
    
----    -- beq (REMEMBER BRANCH OFFSET IS THE DIFFERENCE FROM WHERE YOU WANT TO GO - 2)
----    15 => X"0008", -- add $1, $zero, $zero; 0000 000 000 001 000
----    16 => X"B06F", -- beq $1, $zero, -17; 1011 000 001 10_1111;
    

--    -- or
--    -- 0 => B"0000_0010_1001_1010",

--    -- and
--    -- 1 => B"0000_0010_1001_1011",

--    -- sgt
--    -- 0 => B"0000_0010_1001_1100",

--    -- slt
--    -- 0 => B"0000_0010_1001_1101",
    
--      --0 => X"1041", -- addi $1, $zero, 1; 
--     --sw
--     --1 => B"0011_1010_0100_0100", -- 0011 101 001 000100 -- store $1 into 4($5)
    
--     --lw
--     --2 => B"0010_0000_1000_0100", -- 0010 000 010 000100

--    -- xor
--    -- 2 => B"0000_0010_1001_1110",

--    -- xnor
--    -- 3 => B"0000_0010_1001_1111",

--    -- cutl
--    -- 0 => B"0100_0010_1000_0010",

--    -- cutu
--    -- 0 => B"0101_0010_1000_0010",

--    -- j
--    -- 0 => B"0110_0000_0000_0001",

--    -- sll
--    -- 0 => B"0111_0010_1000_0011",

--    -- srl
--    -- 0 => B"1000_0010_1000_0011",

--    -- subi
--    -- 0 => B"1001_0010_1000_0011",

--    -- nandi
--    -- 0 => B"1010_0010_1000_0100",


--    others => (others => '1') --others are no ops
    
--); 

signal instructionVals : instructionArray := (
    -- $0 = $zero 
    -- $1 = $v0 
    -- $2 = $v1 
    -- $3 = $v2
    -- $4 = $v3 
    -- $5 = $a0 
    -- $6 = $a1
    -- $7 = $t0 

    -- store 0x0010 into 0x0000 for later usage in if statement
    
    --addi $7, $0, 000100;
    0 => X"11C4",   -- 0001 000 111 000100 
    
    -- sll $7, $7, 4;
    1 => X"7FC4",  -- 0111 111 111 000100   
    
    -- or $1, $7, $0;
    2 => X"0E0A",  -- 0000 111 000 001 010 
     
    -- addi $7, $0, 000001;
    3 => X"11C1",  -- 0001 000 111 000001
    
    -- sll $7, $7, 12;
    4 => X"7FCC",  -- 0111 111 111 001100  
    
    -- or $2, $7, $2;
    5 => X"0E92",  -- 0000 111 010 010 010  
    
    -- addi $7, $0, 010000;
    6 => X"11D0",   -- 0001 000 111 010000 
    
    -- or $2, $7, $2;
    7 => X"0E92",   -- 0000 111 010 010 010 
    

    -- addi $7, $0, 001111;
    8 => X"11CF",   -- 0001 000 111 001111    
    
    -- or $3, $7, $0
    9 => X"0E1A",   -- 0000 111 000 011 010  
  

    -- addi $7, $zero, 001111;
    10 => X"11CF",   -- 0001 000 111 001111   
    
    -- sll $7, $7, 4;
    11 => X"7FC4",   -- 0111 111 111 000100 
    
    -- or $4, $7, $4;
    12 => X"0F22",   -- 0000 111 100 100 010 
    
  
    -- addi $7, $zero, 000001;
    13 => X"11C1",   -- 0001 000 111 000001 
    
    -- sll $7, $7, 4;
    14 => X"7FC4",   -- 0111 111 111 000100 
    
    -- or $5, $5, $7;
    15 => X"0BEA",   -- 0000 101 111 101 010 
    

    -- addi $7, $0, 000101;
    16 => X"11C5",   -- 0001 000 111 000101
    
    -- or $6, $6, $7;
    17 => X"0DF2",   -- 0000 110 111 110 010 


    -- WHILE: sgt $7, $6, $zero 
    18 => X"0C3C",   -- 0000 110 000 111 100  
    

    --beq $7, $zero, ENDLABEL (offset of 23)
    19 => X"B1D7",   -- 1011 000 111 010111 
  

    -- subi $6, $6, 1
    20 => X"9D81",   -- 1001 110 110 000001 
    

    -- lw $7, 0($5);
    21 => X"2BC0",   -- 0010 101 111 000000  
    

    --sw $5, 0($0);
    22 => X"3140", -- 0011 000 101 000000   
    

    --addi $5, $zero 000001; 
    23 => X"1141", -- 0001 000 101 000001   
    
    -- sll $5, $5, 8;
    24 => X"7B48", -- 0111 101 101 001000 
    
    -- sgt $7, $7, $5; 
    25 => X"0F7C", -- 0000 111 101 111 100
    
    -- lw $5, 0($zero);
    26 => X"2140", -- 0010 000 101 000000 

    --beq $7, $zero, ELSESTATEMENT (offset of 8)
    27 => X"B1C8", -- 1011 000 111 001000 
    
    -- srl $1, $1, 4;
    28 => X"8244", -- 1000 001 001 000100  
    
    -- or $2, $2, $1;
    29 => X"0452", -- 0000 010 001 010 010
    
    -- addi $7, $0, 001111;
    30 => X"11CF", -- 0001 000 111 001111 
    
    -- sll $7, $7, 4;
    31 => X"7FC4", -- 0111 111 111 000100
    
     -- addi $7, $7, 001111;
    32 => X"1FCF", -- 0001 111 111 001111

    --  sll $7, $7, 8;
    33 => X"7FC8", -- 0111 111 111 001000
    
    -- sw $7, 0($5)
    34 => X"3BC0", -- 0011 111 101 000000
    
   -- j ENDIF; (42) 
    35 => X"602A", -- 0110 000000101010 
    
    -- ELSESTATEMENT: 	sll $3, $3, 2;
    36 => X"76C2", -- 0111 011 011 000010
    
    -- xor $4, $4, $3
    37 => X"08E6", -- 0000 100 011 100 110 
    
    -- addi $7, $0, 001111;
    38 => X"11CF", -- 0001 000 111 001111
    
    -- sll $7, $7, 4;
    39 => X"7FC4", -- 0111 111 111 000100
    
    -- addi $7, $7, 001111;
    40 => X"1FCF", -- 0001 111 111 001111
    
    -- sw $7, 0($5)
    41 => X"3BC0", -- 0011 111 101 000000 

    -- ENDIF: addi $5, $5, 2
    42 => X"1B42", -- 0001 101 101 000010

    -- j WHILE (18)
    43 => X"6012", -- 0110 000000010010     
    
--    -- (AKA 44) ENDLABEL: 
    
--    -- program done
    
    others => (others => '1')
);

begin

process(clk, readAddr) 
begin 
    
    --if(rising_edge(clk)) then
        instruction <= instructionVals(to_integer(unsigned(readAddr)/2));
    --end if;

end process;

end Behavioral;
