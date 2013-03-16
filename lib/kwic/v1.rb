module KWIC
  class V1
    STORAGE_FILE = 'tmp/some_file.txt'

    attr_accessor :core

    # A.K.A MasterControl
    def index(input_text)
      # clear our fake memory
      self.core = {}
      
      input.call(input_text)
      circular_shift.call
      alphabetizing.call
      output.call
    end

    class Input
      def initialize(core)
        @core = core
      end
      
      def call(input)
        FileUtils.rm(STORAGE_FILE) if File.exists?(STORAGE_FILE)

        File.open(STORAGE_FILE, 'w') do |file|
          lines = input.split(/\n/).map do |line|
            file.puts line.chomp
          end
        end
      end
    end

    class CircularShift
      def initialize(core)
        @core = core
      end
      
      def call
        shifts = []

        file = File.open(STORAGE_FILE)
        file.readlines.each_with_index do |line, index|
          line_num = index + 1
          words = line.split(/\s+/)
          words_range = (1..words.length)

          words.each_with_index do |word, i|
            ordering = words_range.map{ |w| (w + i) % words.count }
            shift = ordering.map{ |word_idx| words[word_idx] }.join(' ')
            shifts << [line_num, shift]
          end
        end
        file.close

        @core[:shifts] = shifts
      end
    end

    class Alphabetizing
      def initialize(core)
        @core = core
      end
      
      def call
        alphabetized = @core[:shifts].sort do |(_a, shift_a), (_b, shift_b)|
          shift_a.downcase <=> shift_b.downcase
        end
    
        @core[:alphabetized] = alphabetized
      end
    end

    class Output
      def initialize(core)
        @core = core
      end
      
      def call
        @core[:alphabetized].map do |(line_number, line)|
          "#{line} - #{line_number}"
        end.join("\n").chomp
      end
    end

    [:input, :circular_shift, :alphabetizing, :output].each do |mod|
      define_method(mod) do
        name = mod.to_s.split(/_/).map{ |s| s[0].upcase + s[1,s.length] }.join
        klass = KWIC::V1.const_get(name.to_sym)
        klass.new(core)
      end
    end
  end
end
