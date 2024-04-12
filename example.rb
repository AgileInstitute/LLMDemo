
require 'sublayer'
require './RspecSourceCodeGenerator'

generator = RspecSourceCodeGenerator.new(unit_tests:"# RSpec tests for Santa class
RSpec.describe Santa do
  subject(:santa) { described_class.new }

  describe '#move_floors' do
    context 'when the directions are (())' do
      it 'ends on floor 0' do
        santa.move_floors('(())')
        expect(santa.current_floor).to eq(0)
      end
    end
end")

puts generator.generate


