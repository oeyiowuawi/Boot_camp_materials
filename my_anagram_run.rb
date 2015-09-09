class Anagram
	def initialize(test_string)
		@test_string = test_string
		@new_word_array = []
		@test_string
	end
	def matches(*args)
		@new_word_array = args.select {|match_test| anagram(match_test, @test_string)}
		return @new_word_array
	end

	def anagram(word,anagram)
		if(word.downcase != anagram.downcase)
			new_word = word.downcase.sort
			new_anagram = anagram.downcase.sort
			if(new_anagram == new_word)
				true
			else
				false
			end
		else
			false
		end
	end
end
