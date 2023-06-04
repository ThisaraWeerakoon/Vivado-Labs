----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 09:46:54 PM
-- Design Name: 
-- Module Name: TB_ProgramCounter - Behavioral
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

entity TB_ProgramCounter is
--  Port ( );
end TB_ProgramCounter;

architecture Behavioral of TB_ProgramCounter is

component ProgramCounter

Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (2 downto 0));

end component;

signal D : STD_LOGIC_VECTOR (2 downto 0);
signal Res : STD_LOGIC;
signal Clk : STD_LOGIC;
signal Q : STD_LOGIC_VECTOR(2 downto 0);

constant period : time := 80 ns;

begin
   
UUT : ProgramCounter PORT MAP (
        D => D,
        Res=>Res,
        Clk=> Clk,
        Q => Q
);


process 
begin
    Clk <= '0';
    wait for period/2;
    
    Clk <= '1';
    wait for period/2 ;
    
end process;


--Index 210536 - 110 011 011 001 101 000
--Index 210116 - 110 011 010 011 000 100

process
begin

Res <= '0';

D <= "000";

wait for period;

D <= "100";

wait for period;

D <= "011";

wait for period;

D <= "111";

wait for period;

Res <= '1';

wait for period;

Res <= '0';

D <= "101";

wait;

end process;

end Behavioral;
