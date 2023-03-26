----------------------------------------------------------------------------------
-- Company:
-- Engineer: --
-- Create Date: 03/25/2023 06:29:01 PM
-- Design Name:
-- Module Name: Mux_8_to_1 - Behavioral
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
entity Mux_8_to_1 is
Port ( S : in STD_LOGIC_VECTOR (2 downto 0); D : in STD_LOGIC_VECTOR (7 downto 0);
EN : in STD_LOGIC;
Y : out STD_LOGIC);
end Mux_8_to_1;
architecture Behavioral of Mux_8_to_1 is
component Decoder_3_to_8 port(

 I: in STD_LOGIC_VECTOR; EN: in STD_LOGIC;
Y: out STD_LOGIC_VECTOR );
end component;
signal I0 : STD_LOGIC_VECTOR (2 downto 0);
signal Y0,MinTerms : STD_LOGIC_VECTOR (7 downto 0); signal en0 : STD_LOGIC;
begin
Decoder_3_to_8_0 : Decoder_3_to_8 port map(
I => I0,
EN => en0,
Y => Y0 );
en0 <= EN; -- decoder and multiplexer has same EN I0 <= S ; -- S signals input to decoder
process is begin

for i in 7 downto 0 loop
MinTerms(i) <= D(i) AND Y0(i); -- AND operation between outputs of decoder and inputs of the multiplexers
end loop; wait;
end process;
Y <= MinTerms(0) OR MinTerms(1) OR MinTerms(2) OR MinTerms(3) OR MinTerms(4) OR MinTerms(5) OR MinTerms(6) OR MinTerms(7);
end Behavioral;
