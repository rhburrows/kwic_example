require 'minitest/autorun'
require 'kwic/v2'
require 'all_tests'

class TestKWICV2 < MiniTest::Unit::TestCase
  include AllTests

  def setup
    @kwic = KWIC::V2.new
  end
end
