CE3_Eichman
===========
###Moore ElevatorController VHDL code	
![File](https://github.com/DanielEichman/CE3_Eichman/blob/master/MooreElevatorController_Shell.vhd)
###Moore ElevatorController testbench	
![File](https://github.com/DanielEichman/CE3_Eichman/blob/master/Moore_testbench_Eichman.vhd)
###Screen capture of your simulation results
![File](https://raw.github.com/DanielEichman/CE3_Eichman/master/Moore_testbench_Eichman.JPG)
These results are correct as the floor level loops from first to fourth stopping at each floor for 2 cycles, then it travels right back down to first. Also every floor transition happens at the rising edge of the clock. Once at the fourth floor both up_down and stop are set to zero and the elevator travels to the first floor without stopping. Also while stop is equal to 1 the elevator will not move. 
###Mealy ElevatorController VHDL code
![File](https://github.com/DanielEichman/CE3_Eichman/blob/master/MealyElevatorController_Shell.vhd)
###Mealy ElevatorController testbench		
![File](https://github.com/DanielEichman/CE3_Eichman/blob/master/Mealy_testbench_Eichman.vhd)
###Screen capture of your simulation results
![File](https://raw.github.com/DanielEichman/CE3_Eichman/master/Mealy_testbench_Eichman.JPG)
This test bench is almost exactly the same as Moore_testbench_Eichman.vhd. The main difference is that it loops from first to fourth then back down stopping for 2 clock cycles at each floor. The nextfloor output depends on the current floor and the direction the elevator is travelling. 

The results for floor are exactly the same as the Moore machine so they should be correct. Notice that during the first 40ns (while the elevator is on first), if up_down is 0 (moving down) nextfloor displays first but once the direction changes the nextfloor also changes to second. Where the time marker (yellow line) is the elevator is on fourth and the direction changes to move down at that time nextfloor changes to third. 

###README (20 pts) containing:
- Explanation of testbench results for Mealy and Moore Machines (why are they correct?)
- Answers to questions in this document and in the VHDL shell comments	
