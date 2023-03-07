--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:48:24 03/04/2022
-- Design Name:   
-- Module Name:   C:/Users/Usuari/P3/P3_p2s_core_tb.vhd
-- Project Name:  P3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: P3_p2s_core
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
 
ENTITY P3_p2s_core_tb IS
END P3_p2s_core_tb;
 
ARCHITECTURE behavior OF P3_p2s_core_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT P3_p2s_core
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable_load_p2s : IN  std_logic;
         enable_shift_p2s : IN  std_logic;
         data_DAC_L : IN  std_logic_vector(19 downto 0);
         data_DAC_R : IN  std_logic_vector(19 downto 0);
         din : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable_load_p2s : std_logic := '0';
   signal enable_shift_p2s : std_logic := '0';
   signal data_DAC_L : std_logic_vector(19 downto 0) := (others => '0');
   signal data_DAC_R : std_logic_vector(19 downto 0) := (others => '0');

 	--Outputs
   signal din : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: P3_p2s_core PORT MAP (
          clk => clk,
          reset => reset,
          enable_load_p2s => enable_load_p2s,
          enable_shift_p2s => enable_shift_p2s,
          data_DAC_L => data_DAC_L,
          data_DAC_R => data_DAC_R,
          din => din
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	load_p2s_process :process
   begin
		enable_load_p2s <= '1';
		wait for clk_period*1;
		enable_load_p2s <= '0';
		wait for clk_period*1042;
   end process;
	
	shift_p2s_process :process
   begin
		enable_shift_p2s <= '1';
		wait for clk_period;
		enable_shift_p2s <= '0';
		wait for clk_period*15;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		reset<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		reset<='0';
		
		data_DAC_L<=x"00000";
		data_DAC_R<=x"0F0F0";
		
		wait for 21 us;
		
		data_DAC_L<=x"0F0F0";
		data_DAC_R<=x"00000";
      -- insert stimulus here 

      wait;
   end process;

END;
