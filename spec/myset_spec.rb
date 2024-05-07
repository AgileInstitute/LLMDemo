require 'myset'

describe "myset WITHOUT using existing Ruby Set features" do
    describe "basics" do
        before(:each) do
          array_of_elements = ["red pen"]
          @myset = MySet.new(array_of_elements)
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

    describe "unions and intersections" do
        before(:each) do
          @set_axb = MySet.new(["a", "x", "b"])
          @set_xyz = MySet.new(["x", "y", "z"])
        end

        it "can build an intersection from itself and another set" do
            intersection = @set_axb.intersect_with(@set_xyz)
            expect(intersection.has("x")).to be true
            expect(intersection.has("a")).to be false
            expect(intersection.has("b")).to be false
            expect(intersection.has("y")).to be false
            expect(intersection.has("z")).to be false
        end

        it "can build a union from itself and another set" do
            union = @set_axb.union(@set_xyz)
            expect(union.has("a")).to be true
            expect(union.has("b")).to be true
            expect(union.has("x")).to be true
            expect(union.has("y")).to be true
            expect(union.has("z")).to be true
        end
    end

    describe "supersets and subsets" do
        before(:each) do
            @bigger_set = MySet.new(["a", "b", "c", "d", "e"])
            @smaller_set = MySet.new(["c", "d", "e"])
            @unique_set = MySet.new(["x", "k", "c", "d"])
        end

        it "knows when it is NOT a subset of a larger set" do
            expect(@unique_set.is_subset_of(@bigger_set)).to be false
        end

        it "knows when it is NOT a superset of a smaller set" do
            expect(@bigger_set.is_superset_of(@unique_set)).to be false
        end

        it "knows when it is a superset of another set" do
            expect(@bigger_set.is_superset_of(@smaller_set)).to be true
        end

        it "knows when it is a subset of another set" do
            expect(@smaller_set.is_subset_of(@bigger_set)).to be true
        end
    end
end
