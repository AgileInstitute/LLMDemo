require 'myset'

describe "myset" do
  before(:each) do
    array_of_elements = ["red pen"]
    @myset = MySet.new(array_of_elements)

    @set_axb = MySet.new(["a", "x", "b"])
    @set_xyz = MySet.new(["x", "y", "z"])
  end

  it "can build a union from two other sets" do
      union = @set_axb.union(@set_xyz)
      expect(union.has("a")).to be true
      expect(union.has("b")).to be true
      expect(union.has("x")).to be true
      expect(union.has("y")).to be true
      expect(union.has("z")).to be true
  end

  it "knows it is empty" do
    @myset = MySet.new([])
    expect(@myset.isEmpty).to be true
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
