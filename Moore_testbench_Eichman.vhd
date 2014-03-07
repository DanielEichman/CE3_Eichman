--------------------------------------------------------------------------------
-- Company: USAFA/DFEC
-- Engineer: EICHMAN
-- 
-- Create Date:    	10:33:47 07/07/2012 
-- Design Name:		Moore_testbench_Eichman
-- Module Name:    	Moore testbench
-- Description: 		testbench for testing moore elevator 
--
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Moore_testbench_Eichman IS
END Moore_testbench_Eichman;
 
ARCHITECTURE behavior OF Moore_testbench_Eichman IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MooreElevatorController_Shell
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         stop : IN  std_logic;
         up_down : IN  std_logic;
         floor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal stop : std_logic := '0';
   signal up_down : std_logic := '0';
 	--Outputs
   signal floor : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MooreElevatorController_Shell PORT MAP (
          clk => clk,
          reset => reset,
          stop => stop,
          up_down => up_down,
          floor => floor
        );

   -- Clock process definitions
   clk_process :process
   begin

		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		--start reset the elvator 
		reset <= '1';
		wait for clk_period;
		reset <= '0';
		stop <='1';
		up_down <='1';
		wait for clk_period*2;
		
   	--go to floor 2
		stop<='0';
		up_down<='1';
 		wait for clk_period;
		stop<='1';
		wait for clk_period*2;
		--go to floor 3
		stop<='0';
		up_down<='1';
 		wait for clk_period;
		stop<='1';
		wait for clk_period*2;
		--go to floor 4
		stop<='0';
		up_down<='1';
 		wait for clk_period;
		stop<='1';
		wait for clk_period*2;
		--go back to floor 1 
		stop<='0';
		up_down<='0';
		wait;

	
     end process;

END;
