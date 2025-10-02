class RspecSourceCodeGenerator < Sublayer::Generators::Base
  llm_output_adapter type: :single_string,
    name: "source_code",
    description: "The generated source code in the requested language"

  def initialize(unit_tests:)
    @unit_tests = unit_tests
  end

  def generate
    super
  end

  def prompt
    <<-PROMPT
        You are an expert object-oriented programmer.

        You are tasked with generating source code based on the following unit tests: #{@unit_tests}

        The goal is to ensure the generated source code passes these tests.

        Take a deep breath and think step by step before you start coding.
    PROMPT
  end
end
