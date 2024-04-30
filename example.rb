
require 'sublayer'
require './RspecSourceCodeGenerator'

File.rename("./lib/myset.rb", "./lib/PREVIOUS_myset.rb")

specsFile = File.open("./spec/myset_spec.rb")
theTests = specsFile.read
specsFile.close

generator = RspecSourceCodeGenerator.new(unit_tests:theTests)
solution = generator.generate
File.write("./lib/myset.rb", solution)
