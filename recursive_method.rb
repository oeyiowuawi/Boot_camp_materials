#require 'pry'
class Recursion_example
	attr_accessor :new_arry	
	def initialize
		@new_arry =[]
	end
	def myFlattenmethod(number)
		
		number.map do |i|
			#binding.pry
			if i.is_a? Array
				self.myFlattenmethod(i)
			else
				@new_arry << i
				#binding.pry

			end
			
		end

		#def show_result
			#@new_arry
		#end
		
	end
	
end
lekan = Recursion_example.new
lekan.myFlattenmethod([1,2,3,[4,5,[6,7,[8,9,[0]]]]])
p lekan.new_arry
#p lekan.show_result