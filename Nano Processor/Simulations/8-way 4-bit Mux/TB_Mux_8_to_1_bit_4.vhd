----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 05:32:51 PM
-- Design Name: 
-- Module Name: TB_Mux_8_to_1_bit_4 - Behavioral
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

entity TB_Mux_8_to_1_bit_4 is
--  Port ( );
end TB_Mux_8_to_1_bit_4;

architecture Behavioral of TB_Mux_8_to_1_bit_4 is

component Mux_8_to_1_bit_4
       Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
              D0 : in STD_LOGIC_VECTOR (3 downto 0);
              D1 : in STD_LOGIC_VECTOR (3 downto 0);
              D2 : in STD_LOGIC_VECTOR (3 downto 0);
              D3 : in STD_LOGIC_VECTOR (3 downto 0);
              D4 : in STD_LOGIC_VECTOR (3 downto 0);
              D5 : in STD_LOGIC_VECTOR (3 downto 0);
              D6 : in STD_LOGIC_VECTOR (3 downto 0);
              D7 : in STD_LOGIC_VECTOR (3 downto 0);
              Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal S  : STD_LOGIC_VECTOR (2 downto 0);
signal D0 : STD_LOGIC_VECTOR (3 downto 0);
signal D1 : STD_LOGIC_VECTOR (3 downto 0);
signal D2 : STD_LOGIC_VECTOR (3 downto 0);
signal D3 : STD_LOGIC_VECTOR (3 downto 0);
signal D4 : STD_LOGIC_VECTOR (3 downto 0);
signal D5 : STD_LOGIC_VECTOR (3 downto 0);
signal D6 : STD_LOGIC_VECTOR (3 downto 0);
signal D7 : STD_LOGIC_VECTOR (3 downto 0);
signal Y  : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : Mux_8_to_1_bit_4 PORT MAP(
        S=>S,
        D0=>D0,
        D1=>D1,
        D2=>D2,
        D3=>D3,
        D4=>D4,
        D5=>D5,
        D6=>D6,
        D7=>D7,
        Y=>Y
);

--Index 210536 - 11 0011 0110 0110 1000
--Index 210116 - 11 0011 0100 1100 0100

process
begin

--select D0
S <= "000";
D0<= "0011";
D0<= "0110";
D1<= "1110";
D2<= "1000";
D3<= "1011";
D4<= "0100";
D5<= "1100";
D6<= "0101";
D7<= "0000";

wait for 100 ns;

--select D1
S <= "001";
D0<= "0011";
D0<= "0110";
D1<= "1110";
D2<= "1000";
D3<= "1011";
D4<= "0100";
D5<= "1100";
D6<= "0101";
D7<= "0000";

wait for 100 ns;

--select D2
S <= "010";
D0<= "0011";
D0<= "0110";
D1<= "1110";
D2<= "1000";
D3<= "1011";
D4<= "0100";
D5<= "1100";
D6<= "0101";
D7<= "0000";

wait for 100 ns;

--select D3
S <= "011";
D0<= "0011";
D0<= "0110";
D1<= "1110";
D2<= "1000";
D3<= "1011";
D4<= "0100";
D5<= "1100";
D6<= "0101";
D7<= "0000";

wait for 100 ns;

--select D4
S <= "100";
D0<= "0011";
D0<= "0110";
D1<= "1110";
D2<= "1000";
D3<= "1011";
D4<= "0100";
D5<= "1100";
D6<= "0101";
D7<= "0000";

wait for 100 ns;


--select D5
S <= "101";
D0<= "0011";
D0<= "0110";
D1<= "1110";
D2<= "1000";
D3<= "1011";
D4<= "0100";
D5<= "1100";
D6<= "0101";
D7<= "0000";

wait for 100 ns;


--select D6
S <= "110";
D0<= "0011";
D0<= "0110";
D1<= "1110";
D2<= "1000";
D3<= "1011";
D4<= "0100";
D5<= "1100";
D6<= "0101";
D7<= "0000";

wait for 100 ns;

--select D7
S <= "111";
D0<= "0011";
D0<= "0110";
D1<= "1110";
D2<= "1000";
D3<= "1011";
D4<= "0100";
D5<= "1100";
D6<= "0101";
D7<= "0000";

wait;


end process;

end Behavioral;


