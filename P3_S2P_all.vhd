----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:58:46 03/07/2023 
-- Design Name: 
-- Module Name:    P3_S2P_all - Behavioral 
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

entity P3_S2P_all is
Port (
clk, reset, enable_s2p, enable_buffer_s2p, dout: in std_logic;
data_ADC_L,data_ADC_R: out std_logic_vector(19 downto 0)
);
end P3_S2P_all;

architecture Behavioral of P3_S2P_all is

component S2P_buffer 
  PORT(
         data_s2p : IN  std_logic_vector(63 downto 0);
         enable_buffer_s2p : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         data_ADC_L : OUT  std_logic_vector(19 downto 0);
         data_ADC_R : OUT  std_logic_vector(19 downto 0)
         ); 

end component;

component P3_S2P 
Port ( 	clk : in  STD_LOGIC; 
         dout : in  STD_LOGIC; 
         enable_s2p : in  STD_LOGIC; 
			reset : in STD_LOGIC; 
			data_s2p: out  STD_LOGIC_VECTOR (63 downto 0)
			); 
end component;

signal temp: std_logic_vector(63 downto 0);

begin

U1: P3_S2P port map(clk=>clk, dout=>dout, enable_s2p=>enable_s2p, reset=>reset, data_s2p=>temp);

U2: S2P_buffer port map(data_s2p=>temp, enable_buffer_s2p=>enable_buffer_s2p, reset=>reset,
                           clk=>clk, data_ADC_L=>data_ADC_L, data_ADC_R=>data_ADC_R);

end Behavioral;

