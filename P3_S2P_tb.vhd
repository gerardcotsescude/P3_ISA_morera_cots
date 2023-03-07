--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:38:56 03/04/2022
-- Design Name:   
-- Module Name:   C:/Users/Usuari/P3/P3_S2P_tb.vhd
-- Project Name:  P3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: P3_S2P
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY P3_S2P_tb IS
END P3_S2P_tb;
 
ARCHITECTURE behavior OF P3_S2P_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT P3_S2P
    PORT(
         clk : IN  std_logic;
         dout : IN  std_logic;
         enable_s2p : IN  std_logic;
         reset : IN  std_logic;
         data_s2p : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal dout : std_logic := '0';
   signal enable_s2p : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal data_s2p : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: P3_S2P PORT MAP (
          clk => clk,
          dout => dout,
          enable_s2p => enable_s2p,
          reset => reset,
          data_s2p => data_s2p
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	dout_process :process
   begin
		dout <= '0';
		wait for 16*clk_period;
		dout <= '1';
		wait for 16*clk_period;
   end process;
	
	ce_process :process
   begin
		enable_s2p <= '1';
		wait for clk_period;
		enable_s2p <= '0';
		wait for 15*clk_period;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset<='1';
      wait for 100 ns;	

      wait for clk_period*10;
		reset<='0';

      -- insert stimulus here 

      wait;
   end process;

END;
