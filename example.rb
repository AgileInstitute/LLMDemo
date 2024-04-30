
require 'sublayer'
require './RspecSourceCodeGenerator'

File.rename("./lib/set.rb", "./lib/PREVIOUS_set.rb")

specsFile = File.open("./spec/set_spec.rb")
theTests = specsFile.read
specsFile.close

generator = RspecSourceCodeGenerator.new(unit_tests:theTests)
solution = generator.generate
File.write("./lib/set.rb", solution)
