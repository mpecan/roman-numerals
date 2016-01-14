class Converter
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
    thousands = input.scan(/M{0,3}/).first
    hundreds  = input.scan(/CM|DC{0,3}|CD|C{1,3}/).first
    tens      = input.scan(/XC|LX{0,3}|XL|X{1,3}/).first
    ones      = input.scan(/IX|VI{0,3}|IV|I{1,3}/).first

    result = []

    arabic_thousands_to_roman thousands, result
    arabic_hundreds_to_roman  hundreds,  result
    arabic_tens_to_roman      tens,      result
    arabic_ones_to_roman      ones,      result

    result.join
  end

  private

  def arabic_ones_to_roman(symbol, result)
    result << case symbol
    when 'I'    then '1'
    when 'II'   then '2'
    when 'III'  then '3'
    when 'IV'   then '4'
    when 'V'    then '5'
    when 'VI'   then '6'
    when 'VII'  then '7'
    when 'VIII' then '8'
    when 'IX'   then '9'
    end
  end

  def arabic_tens_to_roman(symbol, result)
    result << case symbol
    when 'X'    then '1'
    when 'XX'   then '2'
    when 'XXX'  then '3'
    when 'XL'   then '4'
    when 'L'    then '5'
    when 'LX'   then '6'
    when 'LXX'  then '7'
    when 'LXXX' then '8'
    when 'XC'   then '9'
    end
  end

  def arabic_hundreds_to_roman(symbol, result)
    result << case symbol
    when 'C'    then '1'
    when 'CC'   then '2'
    when 'CCC'  then '3'
    when 'CD'   then '4'
    when 'D'    then '5'
    when 'DC'   then '6'
    when 'DCC'  then '7'
    when 'DCCC' then '8'
    when 'CM'   then '9'
    end
  end

  def arabic_thousands_to_roman(symbol, result)
    result << case symbol
    when 'M'   then '1'
    when 'MM'  then '2'
    when 'MMM' then '3'
    end
  end

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
