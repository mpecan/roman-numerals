class Converter
  CONVERSIONS = {
    1    => 'I',
    4    => 'IV',
    5    => 'V',
    9    => 'IX',
    10   => 'X',
    40   => 'XL',
    50   => 'L',
    90   => 'XC',
    100  => 'C',
    400  => 'CD',
    500  => 'D',
    900  => 'CM',
    1000 => 'M'
  }

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def to_roman_numerals
    if (input.to_i >= 4000) || (input.to_i.zero?) || (input.to_i.negative?)
      return 'The input must be between 1 and 3999' 
    end

    result = input.reverse.chars.map.with_index do |number, i|

      case i
      when 0 then roman_ones(number)
      when 1 then roman_tens(number)
      when 2 then roman_hundreds(number)
      when 3 then roman_thousands(number)
      end
    end.reverse.join

    result
  end

  def to_arabic_number
    return input if input.is_a? Integer

    roman_numerals = input
    result          = 0

    CONVERSIONS.values.reverse.each do |roman_symbol|
      while roman_numerals.start_with? roman_symbol
        roman_numerals = roman_numerals
                            .slice(roman_symbol.length, roman_numerals.length)
        result += CONVERSIONS.key roman_symbol
      end
    end
    result
  end

  private

  def roman_ones(number)
    case number
    when '1' then 'I'
    when '2' then 'II'
    when '3' then 'III'
    when '4' then 'IV'
    when '5' then 'V'
    when '6' then 'VI'
    when '7' then 'VII'
    when '8' then 'VIII'
    when '9' then 'IX'
    end
  end

  def roman_tens(number)
    case number
    when '1' then 'X'
    when '2' then 'XX'
    when '3' then 'XXX'
    when '4' then 'XL'
    when '5' then 'L'
    when '6' then 'LX'
    when '7' then 'LXX'
    when '8' then 'LXXX'
    when '9' then 'XC'
    end
  end

  def roman_hundreds(number)
    case number
    when '1' then 'C'
    when '2' then 'CC'
    when '3' then 'CCC'
    when '4' then 'CD'
    when '5' then 'D'
    when '6' then 'DC'
    when '7' then 'DCC'
    when '8' then 'DCCC'
    when '9' then 'CM'
    end
  end

  def roman_thousands(number)
    case number
    when '1' then 'M'
    when '2' then 'MM'
    when '3' then 'MMM'
    end
  end
end
