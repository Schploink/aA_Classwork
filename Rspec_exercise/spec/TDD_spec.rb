require "TDD"

describe "#remove_dups" do
  it "should not change array if no duplicates present" do
    expect([].remove_dups).to eq([])
    expect([1].remove_dups).to eq([1])
    expect([1,2,3,4]).to eq([1,2,3,4])
  end
  it "should remove one duplicate" do
    expect([1,1,2,3].remove_dups).to eq([2,3])
  end
  it "should remove multiple duplicates" do
    expect([1,1,2,3,3,4].remove_dups).to eq([2,4])
  end
end

describe "#two_sum" do
  it "should return all pairs of positions where elements at positions sum to 0" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    expect([13, 2, 3, 0].two_sum).to eq([])
  end

  it "should sort smaller index before larger index in each pair, and sort pairs dictionary-wise" do
    expect([1, 0, 2, -2, -1].two_sum).to eq([[0, 4], [2, 3]])
    expect([3, -3, 0, 1, 0].two_sum).to eq([[0,1],[2,4]])
  end


end
#should return all pairs of positions where elements at positions sum to 0
#test if no pairs sum to 0
#should sort smaller index before larger index in each pair
#should sort array of pairs sorted "dictionary-wise"