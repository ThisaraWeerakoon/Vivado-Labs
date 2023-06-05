----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 12:33:13 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin
process(Instruction_Bus)
     begin
if (Instruction_Bus(11) = '1' and Instruction_Bus(10) = '0') then
    Register_en(2) <= Instruction_Bus(9); 
    Register_en(1) <= Instruction_Bus(8); 
    Register_en(0) <= Instruction_Bus(7); 
    
    Immediate_val(3) <= Instruction_Bus(3);
    Immediate_val(2) <= Instruction_Bus(2);
    Immediate_val(1) <= Instruction_Bus(1);
    Immediate_val(0) <= Instruction_Bus(0);
    
    Load_sel <= '0';
    Jump_Flag <= '0';
    
end if;    
if (Instruction_Bus(11) = '0' and Instruction_Bus(10) = '0') then
    Mux_A_En(2) <= Instruction_Bus(9);
     Mux_A_En(1) <= Instruction_Bus(8);
      Mux_A_En(0) <= Instruction_Bus(7);
      
      Mux_B_En(2) <= Instruction_Bus(6);
      Mux_B_En(1) <= Instruction_Bus(5);
      Mux_B_En(0) <= Instruction_Bus(4);
      
      Add_Sub_Sel <= '0'; -- For the RCA circuit adds the numbers when ctrl = '0'
      load_sel <= '1';
      Jump_Flag <= '0';
      
      Register_en(2) <= Instruction_Bus(9); 
      Register_en(1) <= Instruction_Bus(8); 
      Register_en(0) <= Instruction_Bus(7); 
      
      

end if;
if (Instruction_Bus(11) = '0' and Instruction_Bus(10) = '1') then
    Mux_A_En <= "000"; -- To get the negation we can use the adder and first number is 0 (0-a = -a)
      
      Mux_B_En(2) <= Instruction_Bus(9);
      Mux_B_En(1) <= Instruction_Bus(8);
      Mux_B_En(0) <= Instruction_Bus(7);
      
      Add_Sub_Sel <= '1'; -- For the RCA circuit substract the numbers when ctrl = '1'
      load_sel <= '1';
      Jump_Flag <= '0';
      
      Register_en(2) <= Instruction_Bus(9); 
      Register_en(1) <= Instruction_Bus(8); 
      Register_en(0) <= Instruction_Bus(7); 
      

end if;
if (Instruction_Bus(11) = '1' and Instruction_Bus(10) = '1') then
    Register_en(2) <= Instruction_Bus(9); 
      Register_en(1) <= Instruction_Bus(8); 
      Register_en(0) <= Instruction_Bus(7); 
      
       Mux_A_En(2) <= Instruction_Bus(9);
          Mux_A_En(1) <= Instruction_Bus(8);
           Mux_A_En(0) <= Instruction_Bus(7);  -- We need to check the value of the specific register. So we have to enable a path so that the value can come in to instruction Decoder
     --process(In_Reg_Check) begin
    if(In_Reg_Check(0) = '0' and In_Reg_Check(1) = '0' and In_Reg_Check(2) = '0' and In_Reg_Check(3) = '0') then
        Jump_Flag <= '1';
        Address_to_Jump(2) <= Instruction_Bus(2);
        Address_to_Jump(1) <= Instruction_Bus(1);
        Address_to_Jump(0) <= Instruction_Bus(0);
     else
        Jump_Flag <= '0';
    end if;
    --end process
    
end if;

end process;


end Behavioral;
