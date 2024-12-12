----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 04:18:16 PM
-- Design Name: 
-- Module Name: Stall_Mux - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Stall_Mux is
  Port (regDst, jump, branch, memRead, memToReg, memWrite, ALUSrc, regWrite, stallSig : in std_logic;
        alu_op : in std_logic_vector(3 downto 0);
        regDstOut, jumpOut, branchOut, memReadOut, memToRegOut, memWriteOut, ALUSrcOut, regWriteOut : out std_logic;
        alu_op_out : out std_logic_vector(3 downto 0));
end Stall_Mux;

architecture Behavioral of Stall_Mux is

begin
    process(regDst, jump, branch, memRead, memToReg, memWrite, ALUSrc, regWrite, stallSig, alu_op)
        begin
            if stallSig = '1' then
                regDstOut <= regDst; 
                jumpOut <= jump;
                branchOut <= branch; 
                memReadOut <= memRead; 
                memToRegOut <= memToReg; 
                alu_op_out <= alu_op; 
                memWriteOut <= memWrite;
                ALUSrcOut <= ALUSrc; 
                regWriteOut <= regWrite;
--            else
--                regDstOut <= '0'; 
--                jumpOut <= '0';
--                branchOut <= '0'; 
--                memReadOut <= '0'; 
--                memToRegOut <= '0'; 
--                alu_op_out <= "1111"; 
--                memWriteOut <= '0';
--                ALUSrcOut <= '0'; 
--                regWriteOut <= '0';
            end if;
    end process;
end Behavioral;
