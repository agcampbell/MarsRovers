# This program pilots robotic rovers around Martian plateaus to explore the landscape.
# NASA sends a file of containing the plateau grid to survey along with a starting position & route for each rover.
# The first row in the file provides the dimensions of the grid with (0,0) representing the bottom left corner of the survey area.
# Rover instructions are added to a multidimensional array which is looped through to create each rover and execute their respective instructions.
# The program will output a notice of new instructions, the size of the grid, and a block for each rover in the data file listing the rover's start and end positions on the grid.
# The program will scale with the addition of additional rovers added to the rover_orders.txt data file.

require_relative 'grid'
require_relative 'rover'

class MarsRovers

	# Check if instructions file sent from Mission Control
	if File.exists?("rover_instructions.txt")
		
		# Notify user new instructions received from Mission Control
		puts "New instructions received from Mission Control!"
		puts "\n"

		# Open file
		File.open("rover_instructions.txt") do |f|

			# Read file as lines and added into array
			lns = f.readlines
			
			# Get the grid size from line #1
			# Remove carriage return from string before splitting into (x,y) integer coordinate array
			#grid_size = []
			grid_size = lns[0].chomp.split.map{ |x| x.to_i }

			# Validate coordinates are integers and not negative
			if (grid_size.all?{|c| c.class == Fixnum}) && (grid_size.all?{|c| c >= 0})

				# Create the grid
				@g = Grid.new(grid_size)

				# List the grid size
				puts ("Grid is " + @g.width.to_s + "x" + @g.height.to_s)

				puts "\n"

				rovers = [] # Array to hold position and instructions arrays for each rover in file
				i = 1 # Counter for array position starting at first line of rover info
				n = lns.length - 1 # Loop terminus at last line

				# Loop cycles lines after grid designation and adds rover position and instructions to the rovers array
				while i < n do
					pos = lns[i].split
					instr = lns[i+1].chomp.split(//)
					rovers << [pos,instr]
					i += 2
				end

				# Counter for rovers
				rover_counter = 0

				# Loop increments counter, creates a new rover, and executes the instructions for each rover
				rovers.each do |rvr|
					rover_counter += 1
					puts 'Rover #' + rover_counter.to_s
				
					# Rover x coordinate
					x = rvr[0][0].to_i

					# Rover y coordinate
					y = rvr[0][1].to_i

					# Direction rover is facing
					d = rvr[0][2]

					# Check if rover initial position is in the grid
					if @g.in_grid?(x, y)
						# Create rover
						r = Rover.new(x,y,d)

						# List rover start position
						print "Start Position:\t"
						print r.position

						# Execute instructions for rover
						# ASSUMPTION: rover instructions will not take the rover outside of the grid
						inst = rvr[1]
						r.execute(inst)
				
						# List rover end position
						print "End Position:\t"
						print r.position

						puts "\n"
					else
						puts "Rover start position is off the grid! Moving to next rover...."
						puts "\n"
					end

				end

			else
				puts "Invalid grid coordinates. Aborting program!"
			end
		
		end
	else
		# If no orders file exists notify user
		puts "No new orders from Mission Control."
	end

end
