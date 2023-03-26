----------------------------------------------------------------------------------
-- Company:
-- Engineer: --
-- Create Date: 03/25/2023 06:50:40 PM
-- Design Name:
-- Module Name: TB_Mux_8_to_1 - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
 -- Description: --
-- Dependencies: --
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- ----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using -- arithmetic functions with Signed or Unsigned values --use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating -- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity TB_Mux_8_to_1 is

 -- Port ( );
end TB_Mux_8_to_1;
architecture Behavioral of TB_Mux_8_to_1 is
COMPONENT Mux_8_to_1
PORT( S : IN STD_LOGIC_VECTOR(2 downto 0); D : IN STD_LOGIC_VECTOR(7 downto 0);
EN : IN STD_LOGIC;
Y : OUT STD_LOGIC);
END COMPONENT;
SIGNAL S : std_logic_vector(2 downto 0); SIGNAL D : std_logic_vector(7 downto 0); SIGNAL EN : std_logic;
SIGNAL Y : std_logic;
begin
UUT : Mux_8_to_1 PORT MAP( S(0) => S(0),

 S(1) => S(1), S(2) => S(2),
D(0) => D(0), D(1) => D(1), D(2) => D(2), D(3) => D(3), D(4) => D(4), D(5) => D(5), D(6) => D(6), D(7) => D(7),
EN => EN,
Y => Y );
process
begin
--210536 in binary 110 011 011 001 101 000
EN <= '0'; -- set EN to 0
S(0) <= '0'; -- 000

 S(1) <= '0'; S(2) <= '0';
D(0) <= '1';
D(1) <= '0'; D(2) <= '1'; D(3) <= '0'; D(4) <= '0'; D(5) <= '1'; D(6) <= '0'; D(7) <= '0';
WAIT FOR
S(0) <= '0'; S(1) <= '0'; S(2) <= '0';
D(0) <= '0';
D(1) <= '0'; D(2) <= '0'; D(3) <= '0';
-- Set D(0) as 1
-- rest is don't care
100 ns; -- after 100 ns change inputs
-- 000
-- Set D(0) as 0
-- rest is don't care

 D(4) <= '1'; D(5) <= '0';
D(6) <= '0'; D(7) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 101 S(1) <= '0';
S(2) <= '1';
D(0) <= '0';
D(1) <= '0'; -- rest is don't care D(2) <= '0';
D(3) <= '1';
D(4) <= '0';
D(5) <= '1'; -- Set D(5) as 1
D(6) <= '0';-- rest is don't care D(7) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs

 S(0) <= '1'; -- 101 S(1) <= '0';
S(2) <= '1';
D(0) <= '0';
D(1) <= '0'; -- rest is don't care D(2) <= '0';
D(3) <= '1';
D(4) <= '0';
D(5) <= '0'; -- Set D(5) as 0
D(6) <= '0';-- rest is don't care D(7) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 001 S(1) <= '0';
S(2) <= '0';
D(0) <= '0'; -- rest is don't care
D(1) <= '1'; -- Set D(1) as 1

 D(2) <= '0';
D(3) <= '1';
D(4) <= '0';
D(5) <= '0';
D(6) <= '0';-- rest is don't care D(7) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 001 S(1) <= '0';
S(2) <= '0';
D(0) <= '0'; -- rest is don't care
D(1) <= '0'; -- Set D(1) as 0
D(2) <= '0';
D(3) <= '0';
D(4) <= '0';
D(5) <= '1';
D(6) <= '0';-- rest is don't care D(7) <= '0';

 WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 011 S(1) <= '1';
S(2) <= '0';
D(0) <= '1'; -- rest is don't care D(1) <= '0';
D(2) <= '0';
D(3) <= '1'; -- Set D(3) as 1
D(4) <= '1';
D(5) <= '0';
D(6) <= '0';-- rest is don't care D(7) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 011 S(1) <= '1';
S(2) <= '0';

 D(0) <= '0'; -- rest is don't care D(1) <= '1';
D(2) <= '0';
D(3) <= '0'; -- Set D(3) as 0
D(4) <= '0';
D(5) <= '1';
D(6) <= '0';-- rest is don't care D(7) <= '0';
WAIT FOR 100 ns; S(0) <= '0'; -- 110 S(1) <= '1';
S(2) <= '1';
D(0) <= '0'; -- rest is don't care D(1) <= '0';
D(2) <= '1';
D(3) <= '0';
D(4) <= '0'; D(5) <= '0';
D(6) <= '1'; -- Set D(6) as 1

 D(7) <= '0';
WAIT FOR S(0) <= '0'; S(1) <= '1'; S(2) <= '1';
D(0) <= '0'; D(1) <= '0'; D(2) <= '1'; D(3) <= '0'; D(4) <= '0'; D(5) <= '0';
D(6) <= '0';
D(7) <= '0';
-- rest is don't care
100 ns; -- 110
-- rest is don't care
-- Set D(6) as 0
-- rest is don't care
WAIT FOR
EN <= '1'; -- set EN to 1
S(0) <= '0'; -- 000 S(1) <= '0';
100 ns;

 S(2) <= '0';
D(0) <= '1';
D(1) <= '0'; D(2) <= '1'; D(3) <= '0'; D(4) <= '0'; D(5) <= '1'; D(6) <= '0'; D(7) <= '0';
WAIT FOR
S(0) <= '0'; S(1) <= '0'; S(2) <= '0';
D(0) <= '0';
D(1) <= '0'; D(2) <= '0'; D(3) <= '0';
D(4) <= '1';
-- Set D(0) as 1
-- rest is don't care
100 ns; -- after 100 ns change inputs
-- 000
-- Set D(0) as 0
-- rest is don't care

 D(5) <= '0'; D(6) <= '0'; D(7) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 101 S(1) <= '0';
S(2) <= '1';
D(0) <= '0';
D(1) <= '0'; -- rest is don't care D(2) <= '0';
D(3) <= '1';
D(4) <= '0';
D(5) <= '1'; -- Set D(5) as 1
D(6) <= '0';-- rest is don't care D(7) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 101

 S(1) <= '0'; S(2) <= '1';
D(0) <= '0';
D(1) <= '0'; -- rest is don't care D(2) <= '0';
D(3) <= '1';
D(4) <= '0';
D(5) <= '0'; -- Set D(5) as 0
D(6) <= '0';-- rest is don't care D(7) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 001 S(1) <= '0';
S(2) <= '0';
D(0) <= '0'; -- rest is don't care
D(1) <= '1'; -- Set D(1) as 1

 D(2) <= '0';
D(3) <= '1';
D(4) <= '0';
D(5) <= '0';
D(6) <= '0';-- rest is don't care D(7) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 001 S(1) <= '0';
S(2) <= '0';
D(0) <= '0'; -- rest is don't care
D(1) <= '0'; -- Set D(1) as 0
D(2) <= '0';
D(3) <= '0';
D(4) <= '0';
D(5) <= '1';
D(6) <= '0';-- rest is don't care D(7) <= '0';

 WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 011 S(1) <= '1';
S(2) <= '0';
D(0) <= '1'; -- rest is don't care D(1) <= '0';
D(2) <= '0';
D(3) <= '1'; -- Set D(3) as 1
D(4) <= '1';
D(5) <= '0';
D(6) <= '0';-- rest is don't care D(7) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs
S(0) <= '1'; -- 011 S(1) <= '1';
S(2) <= '0';
D(0) <= '0'; -- rest is don't care

 D(1) <= '1'; D(2) <= '0';
D(3) <= '0'; -- Set D(3) as 0
D(4) <= '0';
D(5) <= '1';
D(6) <= '0';-- rest is don't care D(7) <= '0';
WAIT FOR 100 ns; S(0) <= '0'; -- 110 S(1) <= '1';
S(2) <= '1';
D(0) <= '0'; -- rest is don't care D(1) <= '0';
D(2) <= '1';
D(3) <= '0';
D(4) <= '0'; D(5) <= '0';
D(6) <= '1'; -- Set D(6) as 1

D(7) <= '0';
WAIT FOR S(0) <= '0'; S(1) <= '1'; S(2) <= '1';
D(0) <= '0'; D(1) <= '0'; D(2) <= '1'; D(3) <= '0'; D(4) <= '0'; D(5) <= '0';
D(6) <= '0';
D(7) <= '0';
WAIT; end process;
end Behavioral;
-- rest is don't care
100 ns; -- 110
-- rest is don't care
-- Set D(6) as 0
-- rest is don't care
