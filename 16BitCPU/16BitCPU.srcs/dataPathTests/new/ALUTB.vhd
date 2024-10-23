library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALUTB is
end entity;

architecture behavior of ALUTB is
  constant TIME_DELAY : time := 20 ns;
  constant NUM_VALS : integer := 16;



  type A_array is array(0 to (NUM_VALS - 1)) of std_logic_vector(15 downto 0);
  type B_array is array(0 to (NUM_VALS - 1)) of std_logic_vector(15 downto 0);
  type C_array is array(0 to (NUM_VALS - 1)) of std_logic_vector(15 downto 0);
  type Mode_array is array(0 to (NUM_VALS - 1)) of std_logic_vector(2 downto 0);
  type Zero_array is array(0 to (NUM_VALS - 1)) of std_logic;
  
  
  ---------------- SUBTRACTOR ----------------
  -- Full Zeros
  -- a negative and a positive 
  -- a negative and a negative
  -- a positive and negative in which the difference is zero  
  -- a positive and a positive 
  -- overflow only
  -- carry only 
  --------------------------------------------
  
  --------------- Bit AND --------------------
  -- Full Zeros
  -- results in zero 
  -- normal
  --------------------------------------------
  --------------- Bit OR --------------------
  -- Full Zeros 
  -- normal
  --------------------------------------------
  --------------- Bit XOR --------------------
  -- Full Zeros 
  -- normal
  -- result is 0
  --------------------------------------------
  
  constant A_vals : A_array := (
                                ------------------adder--------------------
                                B"0000_0000_0000_0000", 
                                B"1000_1000_0000_0000", 
                                B"0111_0000_0000_0000",
                                B"0000_0000_0000_1000",
                                ------------------------------------------
                                ----------------subtractor----------------
                                B"0000_0000_0000_0000", 
                                B"1000_1000_0000_0000", 
                                B"1111_0000_0000_0000",
                                B"1111_1111_1111_1111",
                                ------------------------------------------
                                ---------------bit and--------------------
                                B"0000_0000_0000_0000",
                                B"1111_1111_1111_1111",
                                B"1111_1111_1111_1111",
                                ------------------------------------------
                                ---------------bit or---------------------
                                B"0000_0000_0000_0000",
                                B"1111_1111_1111_1111",
                                ----------------bit xor-------------------
                                B"0000_0000_0000_0000",
                                B"1111_1111_1111_1111",
                                B"1111_1111_1111_1111"
                                ------------------------------------------
                                );  
                                
  constant B_vals : B_array := (
                                ------------------adder--------------------
                                B"0000_0000_0000_0000",
                                B"0000_0001_0001_0000", 
                                B"1000_0101_0000_0000", 
                                B"0000_0000_0000_0010",
                                -------------------------------------------
                                ----------------subtractor----------------
                                B"0000_0000_0000_0000",
                                B"0000_0001_0001_0000",
                                B"1000_0101_0000_0000",
                                B"1111_1111_1111_1111", 
                                ------------------------------------------
                                ----------------bit and-------------------
                                B"0000_0000_0000_0000",
                                B"0000_0000_0000_0000",
                                B"1111_0000_0000_0000",
                                ------------------------------------------
                                ----------------bit or--------------------
                                B"0000_0000_0000_0000",
                                B"0101_0101_0101_0101",
                                -----------------bit xor------------------
                                B"0000_0000_0000_0000",
                                B"0000_0000_0000_0100",
                                B"1111_1111_1111_1111"
                                ------------------------------------------
                                );
  
  constant C_vals : C_array := (
                                ------------------adder--------------------
                                B"0000_0000_0000_0000", 
                                B"1000_1001_0001_0000", 
                                B"1111_0101_0000_0000", 
                                B"0000_0000_0000_1010",
                                ------------------------------------------
                                ----------------subtractor----------------
                                B"0000_0000_0000_0000",
                                B"1000_0110_1111_0000",
                                B"0110_1011_0000_0000",
                                B"0000_0000_0000_0000", 
                                ---------------bit and--------------------
                                B"0000_0000_0000_0000",
                                B"0000_0000_0000_0000",
                                B"1111_0000_0000_0000",
                                ---------------bit or--------------------- 
                                B"0000_0000_0000_0000",
                                B"1111_1111_1111_1111",
                                -----------------bit xor----------------------
                                B"0000_0000_0000_0000",
                                B"1111_1111_1111_1011",
                                B"0000_0000_0000_0000"
                                );
  
  constant Zero_vals : Zero_array := (
                                     --adder--
                                       '1', 
                                       '0',
                                       '0', 
                                       '0',
                                     --------
                                  --subtractor--
                                       '1',
                                       '0',
                                       '0',
                                       '1',
                                   -----------
                                   --bit and--
                                       '1',
                                       '1',
                                       '0',
                                   --bit or--
                                       '1',
                                       '0',
                                   ----------
                                   ----bit xor---
                                       '1',
                                       '0',
                                       '1'
                                      );
 
               

  constant Mode_vals : Mode_array := (
                                        --adder--
                                           "000", 
                                           "000", 
                                           "000",
                                           "000",
                                           -----
                                         --subtractor--
                                            "001", 
                                            "001", 
                                            "001", 
                                            "001",
                                            ------
                                          --bit and--
                                            "010",
                                            "010",
                                            "010",
                                          --bit or--
                                            "011",
                                            "011",
                                           -------
                                           ---bit xor---
                                            "100",
                                            "100",
                                            "100"
                                           );
                                            
  signal Zero_sig : std_logic;           
  signal A_sig : std_logic_vector(15 downto 0);
  signal B_sig : std_logic_vector(15 downto 0);
  signal C_sig : std_logic_vector(15 downto 0);
  signal Mode_sig : std_logic_vector(2 downto 0);
begin

  DUT : entity work.ALU(behavioral)
    port map(A => A_sig,
             B => B_sig,
             C => C_sig,
             Mode => Mode_sig,
             Zero => Zero_sig
             );    

  stimulus : process
  begin
    for i in 0 to (NUM_VALS - 1) loop
      A_sig <= A_vals(i);
      B_sig <= B_vals(i);
      Mode_sig <= Mode_vals(i);
      wait for TIME_DELAY;
    end loop;
    wait;
  end process stimulus;

  monitor : process
    variable i : integer := 0;
  begin
    wait for TIME_DELAY/4;
    while (i < NUM_VALS) loop
      wait for TIME_DELAY/2;
      assert C_sig = C_vals(i)
        report "C value is incorrect." 
        severity error;

      assert Zero_sig = Zero_vals(i)
        report "Zero value is incorrect."
        severity error;
        
      i := i + 1;
      wait for TIME_DELAY/2;
    end loop;
    wait;
  end process monitor;

end behavior;