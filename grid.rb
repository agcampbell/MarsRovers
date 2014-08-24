class Grid

	# Creates a new grid
	def initialize(grd)
		@width = grd[0]
		@height = grd[1]
	end

	# Gives the width of the grid
	def width
		@width
	end

	# Gives the height of the grid
	def height
		@height
	end

	# Checks if (x,y) rover coordinates fall in the grid
	def in_grid?(x,y)
		if x.between?(0, @width) && y.between?(0, @height)
			return true
		else
			return false
		end
	end
end