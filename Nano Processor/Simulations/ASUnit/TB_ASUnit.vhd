----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:06:29 PM
-- Design Name: 
-- Module Name: TB_ASUnit - Behavioral
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

entity TB_ASUnit is
--  Port ( );
end TB_ASUnit;

architecture Behavioral of TB_ASUnit is

component ASUnit 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       Selector : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       Zero : out STD_LOGIC;
       Overflow : out STD_LOGIC);
end component;

signal A : STD_LOGIC_VECTOR (3 downto 0);
signal B : STD_LOGIC_VECTOR (3 downto 0);
signal Selector : STD_LOGIC;
signal S : STD_LOGIC_VECTOR (3 downto 0);
signal Zero : STD_LOGIC;
signal Overflow : STD_LOGIC;

begin

UUT : ASUnit PORT MAP (
    A => A,
    B => B,
    Selector => Selector,
    S => S,
    Zero => Zero,
    Overflow => Overflow  
);

--Index 210536 - 11 0011 0110 0110 1000
--Index 210116 - 11 0011 0100 1100 0100

process 

begin

-- 1000 + 0110 = 1110
A <= "1000";
B <= "0110";
Selector <= '0'; -- add

WAIT FOR 100ns ;

-- 1100 + 0110 = 1 0010 
A <= "1100";
B <= "0110";
Selector <= '0'; -- add

WAIT FOR 100ns ;

-- 1100 - 0110 = 0110
A <= "1100";
B <= "0110";
Selector <= '1'; -- sub

WAIT FOR 100ns ;

--0011 - 0100 =  1111
A <= "0011";
B <= "0100";
Selector <= '1'; -- sub

WAIT FOR 100ns ;

-- 0011 - 0011 = 0000 -- check Zero flag
A <= "0011";
B <= "0011";
Selector <= '1'; -- add

WAIT ;

end process;

end Behavioral;
