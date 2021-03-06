require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'converter'

class ConverterTest < Minitest::Test

  {1 => 'I', 3 => 'III', 5 => 'V', 10 => 'X', 30 => 'XXX', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}.each do |key, value|
    define_method(:"test_convert_#{key}_to_#{value}") {
      assert_equal "#{value}", Converter.new(key).to_roman_numerals
    }

    define_method(:"test_convert_#{value}_to_#{key}") {
      assert_equal key, Converter.new("#{value}").to_arabic_number
    }
  end

  {4 => 'IV', 9 => 'IX', 19 => 'XIX', 40 => 'XL', 90 => 'XC', 400 => 'CD', 900 => 'CM'}.each do |key, value|
    define_method(:"test_convert_#{key}_to_#{value}") {
      assert_equal "#{value}", Converter.new(key).to_roman_numerals
    }
    define_method(:"test_convert_#{value}_to_#{key}") {
      assert_equal key, Converter.new("#{value}").to_arabic_number
    }
  end


  def test_return_number_if_number_to_arabic_number_is_called
    assert_equal 10, Converter.new(10).to_arabic_number
  end

  def test_MMDCCLV_to_1755
    assert_equal 2755, Converter.new('MMDCCLV').to_arabic_number
  end

  def test_MMMDCCLXXXVI_to_3786
    assert_equal 3786, Converter.new('MMMDCCLXXXVI').to_arabic_number
  end

  def test_DCCCLXXIII_to_873
    assert_equal 873, Converter.new('DCCCLXXIII').to_arabic_number
  end

  def test_MCXI_to_1111
    assert_equal 1111, Converter.new('MCXI').to_arabic_number
  end

  def test_CMXCIX_to_999
    assert_equal 999, Converter.new('CMXCIX').to_arabic_number
  end

  def test_59_to_LIX
    assert_equal 'LIX', Converter.new(59).to_roman_numerals
  end

  def test_1234_to_MCCXXXIV
    assert_equal 'MCCXXXIV', Converter.new(1234).to_roman_numerals
  end

  def test_1597_to_MDXCVII
    assert_equal 'MDXCVII', Converter.new(1597).to_roman_numerals
  end

  def test_max_input_3999
    assert_equal 'The input must be between 1 and 3999', Converter.new(4000).to_roman_numerals
  end

  def test_0_as_input
    assert_equal 'The input must be between 1 and 3999', Converter.new(0).to_roman_numerals
  end

  def test_negative_numbers
    assert_equal 'The input must be between 1 and 3999', Converter.new(-10).to_roman_numerals
  end

  def test_max_lines
    lines = `wc -l "converter.rb"`.strip.split(' ')[0].to_i
    assert lines < 50, "Solution has too many lines #{lines}, expected 50 or less."
  end
end
