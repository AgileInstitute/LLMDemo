require 'myset'

describe "myset" do
  before(:each) do
    array_of_elements = ["red pen"]
    @myset = MySet.new(array_of_elements)
  end

  it "knows that it's NOT empty" do
    expect(@myset.isEmpty).to be false
  end

  it "knows what it has" do
    expect(@myset.has("red pen")).to be true
  end

  it "knows what it doesn't have" do
    expect(@myset.has("purple smartphone")).to be false
  end

end
