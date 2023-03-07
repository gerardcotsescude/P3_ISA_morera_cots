----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:56:12 03/07/2023 
-- Design Name: 
-- Module Name:    P3_S2P - Behavioral 
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
 
entity P3_S2P is 
    Port ( clk : in  STD_LOGIC; 
           dout : in  STD_LOGIC; 
           enable_s2p : in  STD_LOGIC; 
     reset : in STD_LOGIC; 
     data_s2p: out  STD_LOGIC_VECTOR (63 downto 0)); 
end P3_S2P; 
 
architecture P3_S2P_beh of P3_S2P is 
 
 signal reg_int : std_logic_vector(63 downto 0); 
 
begin 
 
  process(clk, reset) 
  begin 
     
    if reset = '1' then 
      reg_int <= (others => '0'); 
    else 
  if (clk'event and clk='1') then 
   if enable_s2p = '1' then 
    reg_int <= reg_int(62 downto 0) & dout; 
   end if; 
  end if; 
 end if; 
   
  end process; 
   
  data_s2p <= reg_int; 
 
end P3_S2P_beh;

