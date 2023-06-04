----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 07:44:33 AM
-- Design Name: 
-- Module Name: TB_RegBank - Behavioral
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

entity TB_RegBank is
--  Port ( );
end TB_RegBank;

architecture Behavioral of TB_RegBank is

component RegBank

    Port ( 
RegBank_EN : in STD_LOGIC_VECTOR(2 downto 0); -- Register enable which selects the register
RegBank_Clk : in STD_LOGIC; 
RegBank_Res : in STD_LOGIC ; 
RegBank_D : in STD_LOGIC_VECTOR(3 downto 0); -- input of register bank

-- output of register bank
RegBank_Q_0 : out STD_LOGIC_VECTOR(3 downto 0); -- output of register 0
RegBank_Q_1 : out STD_LOGIC_VECTOR(3 downto 0); -- output of register 1
RegBank_Q_2 : out STD_LOGIC_VECTOR(3 downto 0); -- output of register 2
RegBank_Q_3 : out STD_LOGIC_VECTOR(3 downto 0); -- output of register 3
RegBank_Q_4 : out STD_LOGIC_VECTOR(3 downto 0); -- output of register 4
RegBank_Q_5 : out STD_LOGIC_VECTOR(3 downto 0); -- output of register 5
RegBank_Q_6 : out STD_LOGIC_VECTOR(3 downto 0); -- output of register 6
RegBank_Q_7 : out STD_LOGIC_VECTOR(3 downto 0)  -- output of register 7
 );
end component;

signal RegBank_EN : STD_LOGIC_VECTOR(2 downto 0); -- Register enable which selects the register
signal RegBank_Clk : STD_LOGIC; 
signal RegBank_Res : STD_LOGIC ; 
signal RegBank_D : STD_LOGIC_VECTOR(3 downto 0); -- input of register bank

-- output of register bank
signal RegBank_Q_0 : STD_LOGIC_VECTOR(3 downto 0); -- output of register 0
signal RegBank_Q_1 : STD_LOGIC_VECTOR(3 downto 0); -- output of register 1
signal RegBank_Q_2 : STD_LOGIC_VECTOR(3 downto 0); -- output of register 2
signal RegBank_Q_3 : STD_LOGIC_VECTOR(3 downto 0); -- output of register 3
signal RegBank_Q_4 : STD_LOGIC_VECTOR(3 downto 0); -- output of register 4
signal RegBank_Q_5 : STD_LOGIC_VECTOR(3 downto 0); -- output of register 5
signal RegBank_Q_6 : STD_LOGIC_VECTOR(3 downto 0); -- output of register 6
signal RegBank_Q_7 : STD_LOGIC_VECTOR(3 downto 0);  -- output of register 7

constant period : time := 100 ns;

begin

UUT : RegBank PORT MAP (

    RegBank_EN => RegBank_EN,
    RegBank_Clk => RegBank_Clk,
    RegBank_Res => RegBank_Res,
    RegBank_D => RegBank_D,
    
    RegBank_Q_0 => RegBank_Q_0,
    RegBank_Q_1 => RegBank_Q_1,
    RegBank_Q_2 => RegBank_Q_2,
    RegBank_Q_3=>  RegBank_Q_3,
    RegBank_Q_4=>  RegBank_Q_4,
    RegBank_Q_5 => RegBank_Q_5,
    RegBank_Q_6 =>  RegBank_Q_6,
    RegBank_Q_7 => RegBank_Q_7
);



process 
begin
    RegBank_Clk <= '0';
    wait for period/2;
    
    RegBank_Clk <= '1';
    wait for period/2 ;
    
end process;  

--Index 210536 - 11 0011 0110 0110 1000
--Index 210116 - 11 0011 0100 1100 0100

process 
begin

    RegBank_EN <= "000"; -- choose Register 0
    RegBank_Res <= '0';
    RegBank_D <= "1000";
    
    wait for period;
    
    RegBank_EN <= "001"; -- choose Register 1
    RegBank_Res <= '0';
    RegBank_D <= "1000";
    
    wait for period;
    
    RegBank_EN <= "010"; -- choose Register 2
    RegBank_Res <= '0';
    RegBank_D <= "0100";
    
    wait for period;
    
    RegBank_EN <= "011"; -- choose Register 3
    RegBank_Res <= '0';
    RegBank_D <= "0011";
    
    wait for period;
    
    RegBank_EN <= "100"; -- choose Register 4
    RegBank_Res <= '0';
    RegBank_D <= "1000";
    
    wait for period;
    
    RegBank_EN <= "101"; -- choose Register 5
    RegBank_Res <= '0';
    RegBank_D <= "0110";
        
    wait for period;
    
    RegBank_EN <= "101"; --  reset register 5
    RegBank_Res <= '1';
    
    wait for period;
    
    RegBank_EN <= "110"; -- choose Register 6
    RegBank_Res <= '0';
    RegBank_D <= "1100";
        
    wait for period;
    
    RegBank_EN <= "111"; -- choose Register 7
    RegBank_Res <= '0';
    RegBank_D <= "1000";
        
    wait ;
    
end process; 

end Behavioral;
