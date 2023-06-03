----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 12:26:58 PM
-- Design Name: 
-- Module Name: TB_Mux_2_to_1_bit_3 - Behavioral
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

entity TB_Mux_2_to_1_bit_4 is
--  Port ( );
end TB_Mux_2_to_1_bit_4;

architecture Behavioral of TB_Mux_2_to_1_bit_4 is

component Mux_2_to_1_bit_4
    Port(  S : in STD_LOGIC;
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal S : STD_LOGIC;
signal D0: STD_LOGIC_VECTOR(3 downto 0);
signal D1: STD_LOGIC_VECTOR(3 downto 0);
signal Y : STD_LOGIC_VECTOR(3 downto 0);

begin

UUT : Mux_2_to_1_bit_4 PORT MAP (
        S  => S ,
        D0 => D0,
        D1 => D1,
        Y  => Y
);

--Index 210536 - 11 0011 0110 0110 1000
--Index 210116 - 11 0011 0100 1100 0100
 
process

begin

--output should be "0110"
S <= '1' ;
D0 <= "1000";
D1 <= "0110";

WAIT FOR 100 ns;

--output should be "0011"
S <= '0';
D0 <= "0011";
D1 <= "0110";

WAIT FOR 100 ns;

--output should be "1100"
S <= '1';
D0 <= "0100";
D1 <= "1100";

WAIT FOR 100 ns;

--output should be "1000"
S <= '0';
D0 <= "1000";
D1 <= "0100";

WAIT;

end process;    

end Behavioral;
