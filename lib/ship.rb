class Ship

	attr_accessor :hits_left

	def initialize
		@hits_left = 1
	end

	

	def damage_from_hit
		@hits_left = @hits_left - 1 
	end

	def sunk?
		hits_left == 0 
	end


end