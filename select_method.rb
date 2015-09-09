class Selector
attr_reader :selector

def even_select(numbers)
	 numbers.select{|a| a%2 == 0}
end
def odd_select(numbers)
	numbers.select {|e| e%2 != 0}
end
def three_letter_select(words)
	words.select {|a| a.length == 3}
end
def greater_than_three(words)
	words.select{|a| a.length > 3}
end
def end_with_ing(words)
	words.select {|a| a.end_with? "ing"}
end

def pick_floats(numbers)
	numbers.select {|a| a.is_a? Float}
end



end