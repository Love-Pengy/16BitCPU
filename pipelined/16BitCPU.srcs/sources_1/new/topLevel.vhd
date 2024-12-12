----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brandon Frazier
-- 
-- Create Date: 11/18/2024 03:45:29 PM
-- Design Name: 
-- Module Name: topLevel - Behavioral
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
-- arithmetic functions with Signed or Unsigned valuesl
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topLevel is
  Port (sysclk : in std_logic;
        sw : in std_logic_vector(15 downto 0);
        rst : in std_logic;
        dp : out std_logic := '0'; 
        an : out std_logic_vector(3 downto 0);
        seg : out std_logic_vector(6 downto 0);
        led : out std_logic_vector(15 downto 0) := (others => '1'));
        
end topLevel;

architecture Structural of topLevel is
    COMPONENT cpuTopLevel is
        PORT(clk, clkEnable, reset : in std_logic;
             switchInAddress : in std_logic_vector(11 downto 0);
             dataMemSwitchOut, registersSwitchOut, programCounterSwitchOut : out std_logic_vector(15 downto 0)); 
    end COMPONENT;
    
    COMPONENT sevenSegmentDriver is
          Port (clk: in std_logic;
                reset: in std_logic;
                input: in std_logic_vector(15 downto 0);
                anOutput: out std_logic_vector(7 downto 0) := (others => '1');
                dpOutput: out std_logic := '1';
                cOutput: out std_logic_vector(6 downto 0) := (others => '1'));
    end COMPONENT;
    
    COMPONENT  clockDivider
          GENERIC(DIVISOR : positive);
          PORT(mclk : IN  std_logic;
               sclk : OUT std_logic);
    end COMPONENT;
    
    FOR ALL: cpuTopLevel use entity work.cpuTopLevel(structural);
    FOR ALL: sevenSegmentDriver use entity work.sevenSegmentDriver(Behavioral);
    FOR ALL: clockDivider use entity work.SSegClockDivider(Behavioral);
    signal dMemSwitch, regSwitch, pcSwitch : std_logic_vector(15 downto 0); 
    signal dMemC, regC, pcC : std_logic_vector(6 downto 0);
    signal dMemAn, regAn, pcAn : std_logic_vector(7 downto 0);
    signal segmentSlowClk, clk : std_logic; 
begin

    LED <= SW;
    
    genClockDivider: clockDivider
        --synthesis
        GENERIC MAP(DIVISOR => 1000000)
        PORT MAP(mclk => sysclk, sclk => clk);
        
    cpuCalc: cpuTopLevel 
        PORT MAP(clk => clk, clkEnable => sw(12), switchInAddress => sw(11 downto 0),  reset => rst, dataMemSwitchOut => dMemSwitch, registersSwitchOut => regSwitch, programCounterSwitchOut => pcSwitch);
    
    ssClockDivider: clockDivider
        -- synthesis
        GENERIC MAP(DIVISOR => 250000)
        PORT MAP(mclk => clk, sclk =>  segmentSlowClk);
    
    sevenSegPC: sevenSegmentDriver
        PORT MAP(clk => segmentSlowClk, reset => rst,  input => pcSwitch, anOutput => pcAn, dpOutput => open, cOutput => pcC); 
        
    sevenSegDMem: sevenSegmentDriver
        PORT MAP(clk => segmentSlowClk, reset => rst,  input => dMemSwitch, anOutput => dMemAn, dpOutput => open, cOutput => dMemC);
        
    sevenSegReg: sevenSegmentDriver
        PORT MAP(clk => segmentSlowClk, reset => rst,  input => regSwitch, anOutput => regAn, dpOutput => open, cOutput => regC); 
       
    process(SW, pcC, pcAn, dMemC, dMemAn, regC, regAn)
    begin
        case (to_integer(unsigned(SW(15 downto 13)))) is
            when 0 => 
                seg <= pcC; 
                an <= pcAn(3 downto 0); 
            when 1 => 
                seg <= dMemC; 
                an <= dMemAn(3 downto 0); 
            when 2 => 
                seg <= regC; 
                an <= regAn(3 downto 0);
            when others =>
                seg <= "1111111"; 
                an <= "1111";
        end case; 
    end process; 
end Structural;
