--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:32:17 03/04/2022
-- Design Name:   
-- Module Name:   C:/Users/Usuari/P3/P3_S2P_buffer_tb.vhd
-- Project Name:  P3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: S2P_buffer
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
 
ENTITY P3_S2P_buffer_tb IS
END P3_S2P_buffer_tb;
 
ARCHITECTURE behavior OF P3_S2P_buffer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT S2P_buffer
    PORT(
         data_s2p : IN  std_logic_vector(63 downto 0);
         enable_buffer_s2p : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         data_ADC_L : OUT  std_logic_vector(19 downto 0);
         data_ADC_R : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_s2p : std_logic_vector(63 downto 0) := (others => '0');
   signal enable_buffer_s2p : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal data_ADC_L : std_logic_vector(19 downto 0);
   signal data_ADC_R : std_logic_vector(19 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: S2P_buffer PORT MAP (
          data_s2p => data_s2p,
          enable_buffer_s2p => enable_buffer_s2p,
          reset => reset,
          clk => clk,
          data_ADC_L => data_ADC_L,
          data_ADC_R => data_ADC_R
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	enable_process :process
   begin
		enable_buffer_s2p <= '1';
		wait for clk_period*1;
		enable_buffer_s2p <= '0';
		wait for clk_period*541;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      reset<='1';
		wait for 100 ns;	

      wait for clk_period*10;
		reset<='0';
		data_s2p<=x"00000000FFFFFFFF";
      -- insert stimulus here 
		wait for 20 us;
		data_s2p<=x"FFFFFFFF00000000";
      wait;
   end process;

END;
