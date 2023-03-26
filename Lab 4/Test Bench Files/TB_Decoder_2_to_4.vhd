----------------------------------------------------------------------------------
-- Company:
-- Engineer: --
-- Create Date: 03/21/2023 01:16:20 AM
-- Design Name:
-- Module Name: TB_Decoder_2_to_4 - Behavioral
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
entity TB_Decoder_2_to_4 is

 -- Port ( );
end TB_Decoder_2_to_4;
architecture Behavioral of TB_Decoder_2_to_4 is COMPONENT Decoder_2_to_4
PORT( I : IN STD_LOGIC_VECTOR(1 downto 0); EN : IN STD_LOGIC;
Y : OUT STD_LOGIC_VECTOR(3 downto 0));
END COMPONENT;
SIGNAL I : std_logic_vector(1 downto 0); SIGNAL Y : std_logic_vector(3 downto 0); SIGNAL EN : std_logic;
begin
UUT : Decoder_2_to_4 PORT MAP(
I(0) => I(0), I(1) => I(1), Y(0) => Y(0), Y(1) => Y(1), Y(2) => Y(2), Y(3) => Y(3), EN => EN
); process

 begin
EN <= '0'; -- set EN to 0
I(0) <= '0'; I(1) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs 
  I(1) <= '1';
WAIT FOR 100 ns; -- after 100 ns change inputs 
  I(0) <= '1';
I(1) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs 
  I(1) <= '1';
WAIT FOR 100 ns; EN <= '1'; -- set EN to 1
I(0) <= '0'; I(1) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs 
  I(1) <= '1';
WAIT FOR 100 ns; -- after 100 ns change inputs

I(0) <= '1'; 
I(1) <= '0';
WAIT FOR 100 ns; -- after 100 ns change inputs 
  I(1) <= '1';
WAIT; 
end process;
end Behavioral;
