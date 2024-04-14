require "rspec"
require_relative "../lib/solution.rb"

RSpec.describe "box" do
  describe "box" do
    before(:each) do
      @box = Box.new
      @box.add("red pen")
    end

    it "knows that the colors parameter is a type of object" do
      @box.add("blue pencil")
      expect(@box.colors("pen")).to eq ["red"]
    end

    it "tells me the color of pens" do
      @box.add("blue pen")
      expect(@box.colors("pen")).to eq ["red", "blue"]
    end

    it "knows what has been added" do
      @box = Box.new
      @box.add("red pen")

      expect(@box.has("red pen")).to be true
    end

    it "can remove something it has" do
      @box = Box.new
      @box.add("red pen")

      @box.remove("red pen")
      expect(@box.has("red pen")).to be false
    end

    it "knows what it doesn't have" do
      @box = Box.new
      @box.add("red pen")

      expect(@box.has("purple smartphone")).to be false
    end

    it "knows how many items have been added - when only one" do
      expect(@box.number_of_items).to eq(1)
    end
  end
end
