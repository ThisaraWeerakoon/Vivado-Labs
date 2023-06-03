----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:06:15 PM
-- Design Name: 
-- Module Name: Mux_2_to_1 - Behavioral
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

entity Mux_2_to_1 is
    Port ( S : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_2_to_1;

architecture Behavioral of Mux_2_to_1 is



begin

Y <= ( NOT ( ( NOT( D(0) AND S ) AND ( NOT (( NOT(S) AND D(1) )  )) ) ) ) AND EN ;


end Behavioral;
