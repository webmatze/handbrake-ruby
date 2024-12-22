module Handbrake
  class Progress
    attr_reader :percentage, :fps, :eta

    def initialize(line)
      parse_progress_line(line)
    end

    private

    def parse_progress_line(line)
      # Parse HandBrakeCLI progress output
      if line =~ /Encoding: task (\d+) of \d+, (\d+\.\d+) %/
        @percentage = $2.to_f
      end
      # Add more parsing as needed
    end
  end
end
