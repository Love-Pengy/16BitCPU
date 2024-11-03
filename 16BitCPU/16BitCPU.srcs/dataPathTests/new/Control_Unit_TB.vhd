----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2024 02:19:10 PM
-- Design Name: 
-- Module Name: Control_Unit_TB - Behavioral
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

entity Control_Unit_tb is
end Control_Unit_tb;

architecture Behavioral of Control_Unit_tb is
    signal opcode : std_logic_vector(3 downto 0);
    signal alu_op, reg_dst, reg_write, alu_src, mem_read : std_logic;
    signal mem_write, mem_to_reg, jump, branch : std_logic;

    component Control_Unit
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
    end component;

begin
    dut: Control_Unit
        Port map (
            opcode => opcode,
            alu_op => alu_op,
            reg_dst => reg_dst,
            reg_write => reg_write,
            alu_src => alu_src,
            mem_read => mem_read,
            mem_write => mem_write,
            mem_to_reg => mem_to_reg,
            jump => jump,
            branch => branch
        );

    process
    begin
        opcode <= "0001";
        wait for 10 ns;
        
        opcode <= "0010";
        wait for 10 ns;

        opcode <= "0011";
        wait for 10 ns;

        opcode <= "0100";
        wait for 10 ns;
        
        opcode <= "0101";
        wait for 10 ns;
        
        opcode <= "0110";
        wait for 10 ns;

        opcode <= "0111";
        wait for 10 ns;

        opcode <= "1000";
        wait for 10 ns;

        opcode <= "1001";
        wait for 10 ns;

        opcode <= "1010";
        wait for 10 ns;

        opcode <= "1111";
        wait for 10 ns;
        
        wait;
    end process;

end Behavioral;

