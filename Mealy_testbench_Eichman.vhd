--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Daniel Eichmnan
--
-- Create Date:   21:13:11 03/06/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Daniel.Eichman/Documents/AFA/ECE281Dir/CE3_Eichman/Mealy_testbench_Eichman.vhd
-- Project Name:  CE3_Eichman
-- Target Device:  
-- Tool versions:  
-- Description:  Test bench for MealyElevatorController
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Mealy_testbench_Eichman IS
END Mealy_testbench_Eichman;
 
ARCHITECTURE behavior OF Mealy_testbench_Eichman IS 
 
    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT MealyElevatorController_Shell
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         stop : IN  std_logic;
         up_down : IN  std_logic;
         floor : OUT  std_logic_vector(3 downto 0);
         nextfloor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal stop : std_logic := '0';
   signal up_down : std_logic := '0';

 	--Outputs
   signal floor : std_logic_vector(3 downto 0);
   signal nextfloor : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MealyElevatorController_Shell PORT MAP (
          clk => clk,
          reset => reset,
          stop => stop,
          up_down => up_down,
          floor => floor,
          nextfloor => nextfloor
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
-------
-- Will loop though all the floors
-------
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
		--go to floor 3
		stop<='0';
		up_down<='0';
 		wait for clk_period;
		stop<='1';
		wait for clk_period*2;
		--go to floor 2
		stop<='0'; 
		up_down<='0'; 
 		wait for clk_period;
		stop<='1';
		wait for clk_period*2;

		--go to floor 1
		stop<='0';
		up_down<='0';
 		wait for clk_period;
		stop<='1';
		wait for clk_period*2;


		wait;
   end process;

END;
