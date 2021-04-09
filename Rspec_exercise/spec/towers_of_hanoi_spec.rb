require "towers_of_hanoi"

describe "TowersOfHanoi" do

  let(:tower_of_hanoi) {TowersOfHanoi.new(4)}
  let(:towers2) {TowersOfHanoi.new}
  let(:towers3) {TowersOfHanoi.new}
  describe "#initialize" do
    it "should initialize an array of three arrays with n elements in first array" do
      expect(tower_of_hanoi.discs).to eq([[4,3,2,1],[],[]])
    end
    it "should set n = 3 if no argument given" do
      expect(towers2.discs).to eq([[3,2,1],[],[]])
    end
  end

  describe "#move" do
    # before(:each) do
    #   tower_of_hanoi.move(0,1)
    #   tower_of_hanoi.move(0,2)
    # end
    it "should take in two numbers a,b as input" do
      expect(tower_of_hanoi.move(0,2)).to_not raise_error
      expect(tower_of_hanoi.move("2",3)).to raise_error
    end
    it "should not move anything if a,b are not on the board" do
      expect(tower_of_hanoi.move(-1,1)).to raise_error
    end
    it "should move the top-most disc from stack a to stack b" do
      expect(tower_of_hanoi.move(0,2)).to eq([[4,3,2],[],[1]])
    end
    it "should not move a larger disc onto a smaller disc" do
      expect(tower_of_hanoi.move(0,2)).to raise_error
    end
  end

  describe "#won?" do
     before(:each) do
      towers3.move(0,2)
      towers3.move(0,1)
      towers3.move(2,1)
      towers3.move(0,2)
      towers3.move(1,0)
      towers3.move(1,2)
      towers3.move(0,2)
    end
    context "When game is won" do
      it "should return true" do
        expect(towers3.won?).to eq(true)
      end
    end
    context "When game is not over" do
      it "should return false" do
        expect(tower_of_hanoi.won?).to eq(false)
      end
    end
  end
end
# - initialize(disc_num = 3) @discs(represented by 2D array of integers)
# - methods #move #valid_move? #won? #play #get_input #display_board
# - move - 



# Keep three arrays, which represents the piles of discs. 
# Pick a representation of the discs to store in the arrays; maybe just a number 
# representing their size. Don't worry too much about making the user interface pretty.

# In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.

# After each move, check to see if they have succeeded in moving all the discs, to the 
# final pile. If so, they win!

# Note: don't worry about testing the UI. Testing console I/O is tricky (don't bother 
# checking gets or puts). Focus on:

# #move
# #won?