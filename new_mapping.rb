class Mapper
	def capitalize_names(names)
		names.map{|a| a.capitalize}
	end
	def double_numbers(numbers)
		numbers.map{|a| a *2}
	end
	def square_numbers(numbers)
		numbers.map{|a| a*a}
	end
	def calc_lengths(names)
		
		names.map do |i|
			i.length
		end
	end
	def trim_names(names)
		names.map do |i|
			a = i.split("")
			a.pop
			a.join("")

		end
	end
end