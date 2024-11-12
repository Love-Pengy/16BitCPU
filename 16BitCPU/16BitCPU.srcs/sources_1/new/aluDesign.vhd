----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 09/17/2024 03:05:11 PM
-- Design Name: 
-- Module Name: aluDesign - Behavioral
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
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
entity ALU is

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
        --Overflow: out std_logic;
        --Cout: out std_logic
        );
        
end ALU;


architecture Behavioral of ALU is
    signal addOutput, twoOutput, shiftOutput, subOutput, bitOutput, compOutput, shiftIndex, cutCalc: std_logic_vector(N-1 downto 0);
    signal comparatorOutput: std_logic_vector(1 downto 0);
    
    COMPONENT nBitAdder
        PORT (
            A, B: in std_logic_vector(N-1 downto 0);
            Cin: in std_logic;
            Cout, Overflow: out std_logic;
            C: out std_logic_vector(N-1 downto 0));
    END COMPONENT;
    
    FOR ALL : nBitAdder USE ENTITY work.nBitAdder(Behavioral);

    COMPONENT comparator 
        PORT (
            in1, in2: in std_logic_vector(N-1 downto 0);
            output: out std_logic_vector(1 downto 0));
    END COMPONENT;
    
    FOR ALL : comparator USE ENTITY work.comparator(Behavioral);
    
    begin
    
    
    adder: nBitAdder
      PORT MAP(A => A, B => B, Cin => '0', C => addOutput, Overflow => open, Cout => open);
    
    subtractor: nBitAdder
      PORT MAP(A => A, B => twoOutput, Cin => '0', C => subOutput, Overflow => open, Cout => open);
      
    -- open (https://stackoverflow.com/questions/19412165/how-to-ignore-output-ports-with-port-maps)
    twoCompliment: nBitAdder
      PORT MAP(A => X"0001", B => (NOT B), Cin => '0', C => twoOutput, Overflow => open, Cout => open);
      
    compare: comparator
      PORT MAP(in1 => A, in2 => B, output => comparatorOutput); 
      
    process(A, B, Mode,subOutput)
        variable tmpForBound: std_logic_vector(N-1 downto 0);
        begin
        case Mode is
            -- addition
            when "0000" =>
              C <= addOutput;
              if(addOutput = X"0000") then
                Zero <= '1';
              else 
                Zero <= '0';
              end if;  
            -- subtraction      
            when "0001" => 
              C <= subOutput;
              if(subOutput = X"0000") then
                Zero <= '1';
              else 
                Zero <= '0';
              end if;     
            -- bitwise AND         
            when "0010" => 
                bitOutput <= A AND B;
                if(bitOutput = X"0000") then 
                    Zero <= '1';
                else 
                    Zero <= '0';
                end if;      
                C <= bitOutput;   
            -- bitwise OR       
            when "0011" =>
                bitOutput <= A OR B;
                if(bitOutput = X"0000") then 
                    Zero <= '1';
                else 
                    Zero <= '0';
                end if;    
                C <= bitOutput;
            -- sgt
            when "0100" => 
                compOutput <= X"0001" when (comparatorOutput = "10") else X"0000";  
                zero <= '1' when (compOutput = X"0000") else '0';
                C <= compOutput;
            -- slt
            when "0101" => 
                 compOutput <= X"0001" when (comparatorOutput = "01") else X"0000";  
                zero <= '1' when (compOutput = X"0000") else '0';
                C <= compOutput;
            -- XOR
            when "0110" =>
                bitOutput <= A XOR B;
                if(bitOutput = X"0000") then 
                    Zero <= '1';
                else 
                    Zero <= '0';
                end if;
                C <= bitOutput;
            -- NAND
            when "0111" => 
                bitOutput <= A NAND B;
                if(bitOutput <= X"0000") then 
                    Zero <= '1';
                 else 
                    Zero <= '0';
                 end if;
                C <= bitOutput;
            -- XNOR
            when "1000" => 
                bitOutput <= A XNOR B;
                if(bitOutput = X"0000") then 
                    Zero <= '1';
                else 
                    Zero <= '0';
                end if;
                C <= bitOutput;
            -- CUTL
            when "1001" =>
                -- could do an ugly switch case 
                cutCalc <= A;
                tmpForBound := B when unsigned(B) < (N/2) else B"0000_0000_0000_1000";
                if(unsigned(tmpForBound) > 0) then
                    for i in 0 to to_integer((unsigned(tmpForBound) - 1)) LOOP
                        cutCalc(i) <= '0';
                    end LOOP;
                end if;
                if(cutCalc = X"0000") then  
                    Zero <= '1';
                else 
                    Zero <= '0';
                end if;
                C <= cutCalc;
            -- CUTU 
            when "1010" => 
                cutCalc <= A;
                tmpForBound := B when unsigned(B) < (N/2) else B"0000_0000_0000_1000";
                if(unsigned(tmpForBound) > 0) then
                    for i in (N-1) downto ((N-1) - to_integer(unsigned(tmpForBound) - 1))  LOOP
                      cutCalc(i) <= '0';
                    end LOOP;
                 end if;
                if(cutCalc = X"0000") then  
                    Zero <= '1';
                else 
                    Zero <= '0';
                end if;
                C <= cutCalc;
            -- SLL
            when "1011" =>
                bitOutput <= A SLL to_integer(unsigned(B));
                if(bitOutput <= X"0000") then 
                    Zero <= '1';
                 else 
                    Zero <= '0';
                 end if;
                C <= bitOutput;
            -- SRL
            when "1100" =>  
                bitOutput <= A SRL to_integer(unsigned(B));
                if(bitOutput <= X"0000") then 
                    Zero <= '1';
                 else 
                    Zero <= '0';
                 end if;
                C <= bitOutput;  
            when others =>
                --nothing
        end case;
    
    end process;
    



end Behavioral;
