class Numbers
	def initialize(number_array)
		@numbers_array = number_array
	end
	def numbers
		@numbers_array
	end
	def sum_up
		@numbers_array.inject(0) {|sum, number|
			sum += number }
	end

end