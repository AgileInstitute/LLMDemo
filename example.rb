
require 'sublayer'
require './rspec_source_code_generator'

# copies the previous implementation code (i.e., 'bot output) to a backup
# for quick comparison (not totally necessary since we have a git repo...)
FileUtils.cp("./lib/nostrek.rb", "./lib/PREVIOUS_nostrek.rb")

# reads the whole specifications file as a string
specsFile = File.open("./spec/nostrek_spec.rb")
theTests = specsFile.read
specsFile.close

# overwrites the implementation file with the newly generated code
generator = RspecSourceCodeGenerator.new(unit_tests:theTests)
solution = generator.generate
File.write("./lib/nostrek.rb", solution)
