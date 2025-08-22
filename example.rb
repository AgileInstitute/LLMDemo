
require 'sublayer'
require './rspec_source_code_generator'

# copies the previous implementation code (i.e., 'bot output) to a backup
# for quick comparison (not totally necessary since we have a git repo...)
FileUtils.cp("./lib/salvo.rb", "./lib/PREVIOUS_salvo.rb")

# reads the whole specifications file as a string
specsFile = File.open("./spec/salvo_spec.rb")
theTests = specsFile.read
specsFile.close

# overwrites the implementation file with the newly generated code
generator = RspecSourceCodeGenerator.new(unit_tests:theTests)
solution = generator.generate
File.write("./lib/salvo.rb", solution)
