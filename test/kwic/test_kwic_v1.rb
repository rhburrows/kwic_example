require 'minitest/autorun'
require 'kwic/v1'
require 'all_tests'

class TestKWICV1 < MiniTest::Unit::TestCase
  include AllTests

  def setup
    @kwic = KWIC::V1.new
  end
end
