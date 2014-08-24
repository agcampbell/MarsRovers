class Rover

	# Creates new rover with the x-axis and y-axis coordinates of its starting position and direction its facing
	def initialize(x,y,d)
		@x_pos = x
		@y_pos = y
		@direction = d
	end

	# Gives the x-axis position of the rover on the grid
	def x_pos
		@x_pos
	end

	# Gives the y-axis position of the rover on the grid
	def y_pos
		@y_pos
	end

	# Gives the direction that the rover is facing
	def direction
		@direction
	end

	# Turns the rover 90 degrees to the left
	def turn_left
		case @direction
		when 'N'
			@direction = 'W'
		when 'W'
			@direction = 'S'
		when 'S'
			@direction = 'E'
		when 'E'
			@direction = 'N'
		end
	end

	# Turns the rover 90 degrees to the right
	def turn_right
		case @direction
		when 'N'
			@direction = 'E'
		when 'E'
			@direction = 'S'
		when 'S'
			@direction = 'W'
		when 'W'
			@direction = 'N'
		end
	end

	# Moves the rover one position forward in the direction it is facing
	def move_forward
		case @direction
		when 'N'
			@y_pos += 1
		when 'S'
			@y_pos -= 1
		when "E"
			@x_pos += 1
		when "W"
			@x_pos -= 1
		end
	end

	# Gives the (x,y) coordinates of the rover and direction it is facing
	def position
		puts @x_pos.to_s + " " + @y_pos.to_s + " " + @direction
	end

	# Executes the array of instructions sent to the rover
	def execute(inst)
		inst.each do |i|

			# Turn the rover to the left
			if i == 'L'
				turn_left

			# Turn the rover to the right
			elsif i == 'R'
				turn_right

			# Move the rover forward one position in the direction its facing
			elsif i == 'M'
				move_forward
				
			else
				# If instruction is not one of 3 valid inputs stop the rover at last position
				puts "Invalid input '#{i}'! Stopping rover!"
				break
			end
		end
	end

end