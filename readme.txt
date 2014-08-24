ABOUT THE PROGRAM:
This program pilots robotic rovers around Martian plateaus to explore the landscape. NASA sends a file of containing the plateau grid to survey along with a starting position & route for each rover. The first row in the file provides the dimensions of the grid with (0,0) representing the bottom left corner of the survey area. Rover instructions are added to a multidimensional array which is looped through to create each rover and execute their respective instructions. The program will output a notice of new instructions, the size of the grid, and a block for each rover in the data file listing the rover's start and end positions on the grid. The program will scale with the addition of additional rovers added to the rover_orders.txt data file.

HOW TO RUN:
1. Make sure Ruby 2.0+ is installed on your computer
2. Have all files in the same directory
3. Run the Mars Rovers program by entering 'ruby mars_rovers.rb' into the console or terminal
4. If an instructions file (rover_instructions.txt) file is present the program will create the grid and execute the instructions from NASA, outputting the start and end positions for each rover
