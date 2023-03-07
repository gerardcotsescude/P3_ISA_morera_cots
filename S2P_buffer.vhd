----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:57:41 03/07/2023 
-- Design Name: 
-- Module Name:    S2P_buffer - Behavioral 
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
 
-- Uncomment the following library declaration if using 
-- arithmetic functions with Signed or Unsigned values 
--use IEEE.NUMERIC_STD.ALL; 
 
-- Uncomment the following library declaration if instantiating 
-- any Xilinx primitives in this code. 
--library UNISIM; 
--use UNISIM.VComponents.all; 
 
entity S2P_buffer is 
    Port ( data_s2p : in  STD_LOGIC_VECTOR (63 downto 0); 
           enable_buffer_s2p : in  STD_LOGIC; 
           reset : in  STD_LOGIC; 
           clk : in  STD_LOGIC; 
           data_ADC_L : out  STD_LOGIC_VECTOR (19 downto 0); 
           data_ADC_R : out STD_LOGIC_VECTOR (19 downto 0)); 
end S2P_buffer; 
 
architecture S2P_buffer_Behavioral of S2P_buffer is 
 
signal data_L_temp : STD_LOGIC_VECTOR (19 DOWNTO 0); 
signal data_R_temp : STD_LOGIC_VECTOR (19 DOWNTO 0); 
 
begin 
 
 process(clk,reset) 
 begin 
  
  if (reset='1') then 
   data_L_temp<=(others => '0'); 
   data_R_temp<=(others => '0'); 
  else 
   if (clk'event and clk='1') then 
    if (enable_buffer_s2p='1') then 
     data_L_temp<=data_s2p(63 downto 44); 
     data_R_temp<=data_s2p(31 downto 12); 
    end if; 
   end if; 
  end if; 
 end process; 
 
 data_ADC_L<=data_L_temp; 
 data_ADC_R<=data_R_temp; 
  
end S2P_buffer_Behavioral;

