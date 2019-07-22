require "test_helper"

class TinyTldLengthTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TinyTldLength::VERSION
  end

  def test_it_does_something_useful
    list = TinyTldLength::List.new.call
    assert !list.nil?
  end

end
