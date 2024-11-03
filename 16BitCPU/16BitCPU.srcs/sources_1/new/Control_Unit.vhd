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
        alu_op : out std_logic; 
        reg_dst : out std_logic;                   
        reg_write : out std_logic;                 
        alu_src : out std_logic;                   
        mem_read : out std_logic;                  
        mem_write : out std_logic;                 
        mem_to_reg : out std_logic;                 
        jump : out std_logic;
        branch : out std_logic
    );
end Control_Unit;

architecture Behavioral of Control_Unit is
begin
    alu_op <= '0';       
    reg_dst <= '0';        
    reg_write <= '0';      
    alu_src <= '0';        
    mem_read <= '0';       
    mem_write <= '0';      
    mem_to_reg <= '0';     
    jump <= '0';
    branch <= '0';
    
    process(opcode)
    begin
        case opcode is
            when "0001" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= '0';
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '1';
            when "0010" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '1';
                mem_to_reg <= '1';
                alu_op <= '0';
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '1';
            when "0011" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '1';
                mem_to_reg <= '0';
                alu_op <= '0';
                mem_write <= '1';
                alu_src <= '0';
                reg_write <= '0';
            when "0100" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= '0';
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '1';
            when "0101" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= '0';
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '1';
            when "0110" =>
                reg_dst <= '0';
                jump <= '1';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= '0';
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '1';
            when "0111" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= '0';
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '0';
            when "1000" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= '0';
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '1';
            when "1001" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= '0';
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '1';
            when "1010" =>
                reg_dst <= '0';
                jump <= '0';
                branch <= '1';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= '0';
                mem_write <= '0';
                alu_src <= '0';
                reg_write <= '0';
            when others =>
                reg_dst <= '1';
                jump <= '0';
                branch <= '0';
                mem_read <= '0';
                mem_to_reg <= '0';
                alu_op <= '1';
                mem_write <= '0';
                alu_src <= '1';
                reg_write <= '1';
        end case;
    end process;
end Behavioral;

