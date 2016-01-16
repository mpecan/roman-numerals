class Converter
  CONVERSIONS = {
    1000 => 'M',
    900  => 'CM',
    500  => 'D',
    400  => 'CD',
    100  => 'C',
    90   => 'XC',
    50   => 'L',
    40   => 'XL',
    10   => 'X',
    9    => 'IX',
    5    => 'V',
    4    => 'IV',
    1    => 'I'
  }

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def to_roman_numerals
    if (input.to_i >= 4000) || (input.to_i.zero?) || (input.to_i.negative?)
      return 'The input must be between 1 and 3999' 
    end

    arabic_number = input
    result        = ''

    CONVERSIONS.keys.each do |number|
      while arabic_number >= number
        arabic_number -= number
        result << CONVERSIONS[number]
      end
    end
    result
  end

  def to_arabic_number
    return input if input.is_a? Integer

    roman_numerals = input
    result          = 0

    CONVERSIONS.values.each do |roman_symbol|
      while roman_numerals.start_with? roman_symbol
        roman_numerals = roman_numerals
                            .slice(roman_symbol.length, roman_numerals.length)
        result += CONVERSIONS.key roman_symbol
      end
    end
    result
  end
end
