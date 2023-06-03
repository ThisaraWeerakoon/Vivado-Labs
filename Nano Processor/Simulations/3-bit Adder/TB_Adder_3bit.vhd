----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 06:36:12 PM
-- Design Name: 
-- Module Name: TB_Adder_3bit - Behavioral
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

entity TB_Adder_3bit is
--  Port ( );
end TB_Adder_3bit;

architecture Behavioral of TB_Adder_3bit is

component Adder_3bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));

end component;

signal A : STD_LOGIC_VECTOR (2 downto 0);
signal S : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT : Adder_3bit PORT MAP (
        A => A,
        S => S
);

--Index 210536 - 110 011 011 001 101 000
--Index 210116 - 110 011 010 011 000 100

process 

begin 

--output should be 001
A <= "000";

WAIT FOR 100ns;

--output should be 010
A <= "001";

WAIT FOR 100ns;

--output should be 011
A <= "010";

WAIT FOR 100ns;

--output should be 100
A <= "011";

WAIT FOR 100ns;

--output should be 101
A <= "100";

WAIT FOR 100ns;

--output should be 110
A <= "101";

WAIT FOR 100ns;

--output should be 111
A <= "110";

WAIT;

end process;

end Behavioral;
