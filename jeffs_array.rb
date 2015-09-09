class JeffsArray
	def initialize(new_array)
		@new_array = new_array

	end
	def new_pop
		
		#x = @new_array.last
		#@new_array.delete_at(-1)
		#x
		@new_array.pop
	end

	def new_size
		@new_array.length
	end
end