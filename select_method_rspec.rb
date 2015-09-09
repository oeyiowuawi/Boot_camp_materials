require_relative "select_method"
describe "#select method" do
  attr_reader :selector
  before :each do
    @selector = Selector.new
  end
  
  it "can select the even numbers" do
    numbers = [1,2,3,4,5,6,7,8,9,10]
    
    expect(selector.even_select(numbers)).to eql([2,4,6,8,10])  
  end
  
  it "can select the odd numbers" do
    numbers = [1,2,3,4,5,6,7,8,9,10]
    
    expect(selector.odd_select(numbers)).to eql([1,3,5,7,9])  
  end
  
  it "can select words with 3 letters" do
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    
    expect(selector.three_letter_select(words)).to eql(["bad", "cat", "dog", "red"])
  end
  
  it "can select words with more than 3 letters" do
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    
    expect(selector.greater_than_three(words)).to eql(["pill", "finger", "blue", "table"])
  end
  
  it "can select word that end in -ing" do
    words = ["bring", "finger", "drought", "singing", "bingo", "purposeful"]
    
    expect(selector.end_with_ing(words)).to eql(["bring", "singing"])
  end
  
  it "can pick floats" do
    numbers = [3, 1.4, 3.5, 2, 4.9, 9.1, 8.0]
    
    expect(selector.pick_floats(numbers)).to eql([1.4, 3.5, 4.9, 9.1, 8.0])
  end
end