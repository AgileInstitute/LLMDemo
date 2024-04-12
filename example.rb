
require 'sublayer'
require './RspecSourceCodeGenerator'

specsFile = File.open("./spec/specs.rb")
theTests = specsFile.read
specsFile.close

generator = RspecSourceCodeGenerator.new(unit_tests:theTests)

solution = generator.generate
File.write("./lib/solution.rb", solution)
