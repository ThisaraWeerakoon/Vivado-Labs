----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:58:37 AM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

entity Nano_Processor is
    Port ( Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Overflow :out std_logic;
        R7_out : out std_logic_vector(3 downto 0);
        Zero : out std_logic);
end Nano_Processor;

architecture Behavioral of Nano_Processor is

component Mux_2_to_1_3bit 
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_Flag : in std_logic;
           C_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_Counter_3bit
    Port ( Data_in : in STD_LOGIC_VECTOR (2 downto 0);
           Memory_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC);
end component;

component adder_3_bit 
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ROM 
    Port ( memorySel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Instruction_Decoder
    Port ( Register_en : out STD_LOGIC_VECTOR (2 downto 0);
           Instruction_Bus : in STD_LOGIC_VECTOR (11 downto 0);
            In_Reg_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Load_sel : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
            Add_Sub_Sel : out STD_LOGIC;
            Address_to_Jump : out STD_LOGIC_VECTOR (2 downto 0);
           Immediate_val : out STD_LOGIC_VECTOR (3 downto 0);
           Mux_A_En : out STD_LOGIC_VECTOR (2 downto 0);
           Mux_B_En : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_2_to_1_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC_VECTOR (3 downto 0);
           Load_Sel : in STD_LOGIC);
end component;

component Add_Sub_RCA is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           S_out : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

component Mux_8_way_4_bit 
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
            R1 : in STD_LOGIC_VECTOR (3 downto 0);
            R2 : in STD_LOGIC_VECTOR (3 downto 0);
            R3 : in STD_LOGIC_VECTOR (3 downto 0);
            R4 : in STD_LOGIC_VECTOR (3 downto 0);
            R5 : in STD_LOGIC_VECTOR (3 downto 0);
            R6 : in STD_LOGIC_VECTOR (3 downto 0);
            R7 : in STD_LOGIC_VECTOR (3 downto 0);
           Out_4_bit : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0));
end component;

component Register_Bank_8
    Port ( Data_in : in STD_LOGIC_VECTOR (3 downto 0);
           Register_en : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Clk :  in STD_LOGIC;
           R0_out : out STD_LOGIC_VECTOR (3 downto 0);
           R1_out : out STD_LOGIC_VECTOR (3 downto 0);
           R2_out : out STD_LOGIC_VECTOR (3 downto 0);
           R3_out : out STD_LOGIC_VECTOR (3 downto 0);
           R4_out : out STD_LOGIC_VECTOR (3 downto 0);
           R5_out : out STD_LOGIC_VECTOR (3 downto 0);
           R6_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal bus0 :std_logic_vector(2 downto 0) :="000";
signal bus1 :std_logic_vector(2 downto 0) :="000";
signal bus3 :std_logic_vector(2 downto 0) :="000";
signal bus4 :std_logic_vector(2 downto 0) :="000";
signal bus6 :std_logic_vector(2 downto 0) :="000";
signal bus9 :std_logic_vector(2 downto 0) :="000";
signal bus10 :std_logic_vector(2 downto 0) :="000";

signal bus2 : std_logic_vector(11 downto 0):="000000000000";

signal bus8 : std_logic_vector(3 downto 0):="0000";
signal bus13 : std_logic_vector(3 downto 0):="0000";
signal bus14 : std_logic_vector(3 downto 0):="0000";
signal bus15 : std_logic_vector(3 downto 0):="0000";
signal bus16 : std_logic_vector(3 downto 0):="0000";
signal bus17 : std_logic_vector(3 downto 0):="0000";
signal bus18 : std_logic_vector(3 downto 0):="0000";
signal bus19 : std_logic_vector(3 downto 0):="0000";
signal bus20 : std_logic_vector(3 downto 0):="0000";
signal bus21 : std_logic_vector(3 downto 0):="0000";
signal bus22 : std_logic_vector(3 downto 0):="0000";
signal bus23 : std_logic_vector(3 downto 0):="0000";
signal bus24 : std_logic_vector(3 downto 0):="0000";

signal bus5 : std_logic;
signal bus7 : std_logic;
signal bus11 : std_logic;
begin

Program_Counter_3bit_Zero : Program_Counter_3bit
port map(
Data_in => bus0,
Memory_Sel => bus1,
Clk => Clk,
Reset => Reset
);

ROM_Zero : ROM 
port map(
memorySel => bus1,
Instruction_Bus => bus2);

adder_3_bit_Zero : adder_3_bit
port map(
A => bus1,
C_out => bus3 );

Mux_2_to_1_3bit_Zero : Mux_2_to_1_3bit 
port map(
A => bus3,
B => bus4,
Jump_Flag => bus5,
C_out => bus0);

Instruction_Decoder_Zero : Instruction_Decoder
port map(
Instruction_Bus => bus2,
Register_en => bus6,
Load_sel => bus7,
Immediate_val => bus8,
Mux_A_En  => bus9,
 Mux_B_En => bus10,
 Add_Sub_Sel => bus11,
 In_Reg_Check => bus13,
 Address_to_Jump => bus4,
 Jump_Flag => bus5
);

Add_Sub_RCA_Zero : Add_Sub_RCA
port map(
A => bus13,
B => bus14,
S => bus11,
S_out => bus15,
Overflow =>  Overflow,
Zero => Zero 
);

Mux_2_to_1_4bit_Zero : Mux_2_to_1_4bit
port map(
A => bus8,
B => bus15,
C_out => bus16,
Load_Sel => bus7);

Register_Bank_8_Zero : Register_Bank_8
port map(
Data_in => bus16,
Register_en => bus6,
Reset => Reset,
Clk => Clk,
R0_out => bus17,
R1_out => bus18,
R2_out => bus19,
R3_out => bus20,
R4_out => bus21,
R5_out => bus22,
R6_out => bus23,
R7_out => bus24
);

Mux_8_way_4_bit_A : Mux_8_way_4_bit
port map(
R0 => bus17,
R1 => bus18,
R2 => bus19,
R3 => bus20,
R4 => bus21,
R5 => bus22,
R6 => bus23,
R7 => bus24,
Out_4_bit => bus13,
Reg_Sel => bus9);

Mux_8_way_4_bit_B : Mux_8_way_4_bit
port map(
R0 => bus17,
R1 => bus18,
R2 => bus19,
R3 => bus20,
R4 => bus21,
R5 => bus22,
R6 => bus23,
R7 => bus24,
Out_4_bit => bus14,
Reg_Sel => bus10);

R7_out <= bus24;

end Behavioral;
