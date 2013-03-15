module KWIC
  class V2
    # Master Control
    def index(input_text)
      line_storage = LineStorage.new

      input = Input.new(line_storage)
      circular_shift = CircularShift.new(line_storage)
      alphabetizer = Alphabetizer.new(circular_shift)
      output = Output.new(circular_shift, alphabetizer)

      input.call(input_text)
      circular_shift.setup!
      alphabetizer.index!
      output.call
    end

    class LineStorage
      attr_reader :lines
      
      def initialize
        @lines = []
      end
      
      def add_line(line)
        @lines << line
      end
    end
    
    class Input
      def initialize(line_storage)
        @line_storage = line_storage
      end

      def call(input)
        input.split(/\n/).each do |line|
          @line_storage.add_line(line) unless line.empty?
        end
      end
    end

    class CircularShift
      def initialize(line_storage)
        @line_storage = line_storage
      end

      def setup!
        @shifts = []

        @line_storage.lines.each_with_index do |line, index|
          line_num = index + 1
          words = line.split(/\s+/)
          words_range = (1..words.length)

          words.each_with_index do |word, i|
            ordering = words_range.map{ |w| (w + i) % words.count }
            shift = ordering.map{ |word_idx| words[word_idx] }.join(' ')
            @shifts << [line_num, shift]
          end
        end
      end

      def shifts
        @shifts.map{ |s| s[1] }
      end

      def shift(index)
        @shifts[index][1]
      end

      def line_number_for(index)
        @shifts[index][0]
      end
    end

    class Alphabetizer
      def initialize(circular_shift)
        @circular_shift = circular_shift
        @shifts = []
      end

      def index!
        i = 0
        @shifts = @circular_shift.shifts.map{ |s| [s, i].tap{ |_| i += 1 } }.
          sort{ |a, b| a[0].downcase <=> b[0].downcase }.map{ |s| s[1] }
      end

      def shifts
        @shifts
      end
    end

    class Output
      def initialize(circular_shift, alphabetizer)
        @circular_shift, @alphabetizer = circular_shift, alphabetizer
      end
      
      def call
        @alphabetizer.shifts.map do |i|
          shift = @circular_shift.shift(i)
          line_number = @circular_shift.line_number_for(i)

          "#{shift} - #{line_number}"
        end.join("\n").chomp
      end
    end
  end
end
