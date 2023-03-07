----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:45:47 03/07/2023 
-- Design Name: 
-- Module Name:    P3_p2s_core - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
 
entity P3_p2s_core is 
    Port (  
  clk : in STD_LOGIC; 
  reset : in  STD_LOGIC; 
  enable_load_p2s : in STD_LOGIC; 
  enable_shift_p2s : in STD_LOGIC; 
  data_DAC_L : in  STD_LOGIC_VECTOR (19 downto 0); 
  data_DAC_R : in STD_LOGIC_VECTOR (19 downto 0); 
  din : out  STD_LOGIC); 
end P3_p2s_core; 
 
architecture Behavioral of P3_p2s_core is 
 
signal signalbuffer : STD_LOGIC_VECTOR (63 downto 0); 
 
begin 
 
process (clk,reset) 
 
 begin 
  
 if (reset='1') then 
  signalbuffer<=(others=>'0'); 
 else 
  if (clk'event and clk='1') then 
   if (enable_load_p2s = '1') then 
    signalbuffer<= "XXXXXXXXXXXX" & data_DAC_L & 
"XXXXXXXXXXXX" & data_DAC_R; 
   elsif (enable_shift_p2s='1') then  
    signalbuffer<= signalbuffer(62 downto 0) & 'X'; 
   end if; 
  end if; 
 end if;   
   
end process; 
  
din<=signalbuffer(63);  
 
end Behavioral;

