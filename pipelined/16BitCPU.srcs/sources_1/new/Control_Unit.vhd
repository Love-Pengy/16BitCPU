----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 02:34:42 PM
-- Design Name: 
-- Module Name: Control_Unit - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Control_Unit is
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
end Control_Unit;

architecture Behavioral of Control_Unit is
begin 
    process(opcode)
    begin
        case opcode is
            -- IMMEDIATE AND JUMP INSTRUCTIONS --
            when "0001" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= "0000";
                mem_write <= '0';
                alu_src <= '1';
                reg_write <= '1';
                IFflush <= '0';
            when "0010" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '1';
                mem_to_reg <= '1';
                alu_op <= "0000";
                mem_write <= '0';
                alu_src <= '1';
                reg_write <= '1';
                IFflush <= '0';
            when "0011" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= "0000";
                mem_write <= '1';
                alu_src <= '1';
                reg_write <= '0';
                IFflush <= '0';
            when "0100" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= "1001";
                mem_write <= '0';
                alu_src <= '1';
                reg_write <= '1';
                IFflush <= '0';
            when "0101" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= "1010";
                mem_write <= '0';
                alu_src <= '1';
                reg_write <= '1';
                IFflush <= '0';
            when "0110" =>
                reg_dst <= '0';
                jump <= '1';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= "1111";
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '0';
                IFflush <= '0';
            when "0111" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= "1011";
                mem_write <= '0';
                alu_src <= '1';
                reg_write <= '1';
                IFflush <= '0';
            when "1000" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= "1100";
                mem_write <= '0';
                alu_src <= '1';
                reg_write <= '1';
                IFflush <= '0';
            when "1001" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= "0001";
                mem_write <= '0';
                alu_src <= '1';
                reg_write <= '1';
                IFflush <= '0';
            when "1010" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= "0111";
                mem_write <= '0';
                alu_src <= '1';
                reg_write <= '1';
                IFflush <= '0';
            when "1011" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '1';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= opcode;
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '0';
                if (branchSig = '1') then
                    branch <= '1';
                    IFflush <= '1';
                else
                    branch <= '0';
                    IFflush <= '0';
                end if;
            -- R TYPE INSTRUCTIONS --
            when "0000" => 
                reg_dst <= '1';
                jump <= '0'; 
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '1';
                IFflush <= '0';
                case func is 
                    when "000" => 
                        alu_op <= "0000";
                    when "001" => 
                        alu_op <= "0001"; 
                    when "010" => 
                        alu_op <= "0011";
                    when "011" =>
                        alu_op <= "0010";
                    when "100" => 
                        alu_op <= "0100"; 
                    when "101" =>
                        alu_op <= "0101";
                    when "110" =>
                        alu_op <= "0110";
                    when "111" => 
                        alu_op <= "1000";
                    when others => 
                        -- nothing
                end case;
             -- NOP --
             when "1111" => 
                reg_dst <= '0';
                jump <= '0'; 
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= opcode;
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '0';
                IFflush <= '0';
             -- DEFAULT FOR I/J TYPE INSTRUCTIONS --
             when others =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= opcode;
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '0';
                IFflush <= '0';
        end case;
    end process;
end Behavioral;

