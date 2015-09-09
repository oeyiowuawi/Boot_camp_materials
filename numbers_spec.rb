require_relative "numbers"
gem 'pry'

describe Numbers do
  before :each do
    @numbers = Numbers.new([1,2,3,4,6])
  end

  describe "#new" do
    it "returns back an instance of the Numbers class " do
      expect(@numbers).to be_a Numbers
    end
  end

  describe "#numbers" do
    it "returns back the array of numbers it was initialized with" do
      expect(@numbers.numbers).to eql([1,2,3,4,6])
    end

  describe "#sum_up"
    it "will sum up the array of numbers" do
      expect(@numbers.sum_up).to eql(16)
    end
  end
end
