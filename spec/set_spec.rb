require 'set'

describe "set" do
  before(:each) do
    @set = Set.new(["red pen"])
  end

  it "knows what it has" do
    expect(@set.has("red pen")).to be true
  end


  it "knows what it doesn't have" do
    expect(@set.has("purple smartphone")).to be false
  end

end
