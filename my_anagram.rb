require_relative "my_anagram_run"
RSpec.describe "Anagram" do
  it "no matches" do
    subject = Anagram.new("diaper")
    matches = subject.matches("hello", "world", "zombies", "pants")
    expect(matches).to eq []
  end
  it "detects simple Anagram" do
    subject = Anagram.new("ban")
    matches = subject.matches('nab', 'stand', 'at')
    expect(matches).to eq ['nab']
  end
  it "does not detect false positives" do
    subject = Anagram.new("galea")
    matches = subject.matches("eagle")
    expect(matches).to eq []
  end
  it "detects multiple Anagrams" do
    subject = Anagram.new("master")
    matches = subject.matches('stream', 'pigeon', 'maters')
    expect(matches).to eq ['stream', 'maters']
  end
  it "does not detect Anagram subsets" do
    subject = Anagram.new("good")
    matches = subject.matches('dog', 'goody')
    expect(matches).to eq []
  end
  it "detects Anagram" do
    subject = Anagram.new("listen")
    matches = subject.matches('enlists', 'google', 'inlets', 'banana')
    expect(matches).to eq ['inlets']
  end
  it "detects multiple Anagrams" do
    subject = Anagram.new("allergy")
    matches = subject.matches('gallery', 'ballerina', 'regally', 'clergy', 'largely', 'leading');
    expect(matches).to eq ['gallery', 'regally', 'largely']
  end
  it "detects Anagrams case-insensitively" do
    subject = Anagram.new("Orchestra");
    matches = subject.matches('cashregister', 'Carthorse', 'radishes')
    expect(matches).to eq ['Carthorse']
  end
  it "does not detect a word as its own Anagram" do
    subject = Anagram.new("banana");
    matches = subject.matches('Banana')
    expect(matches).to eq []
  end
  it "matches() accepts string arguments" do
    subject = Anagram.new("yeet");
    matches = subject.matches("stand", "yete", "at")
    expect(matches).to eq ["yete"]
  end
  it "matches() accepts single string argument" do
    subject = Anagram.new("yeet");
    matches = subject.matches("teey")
    expect(matches).to eq ["teey"]
  end
end
