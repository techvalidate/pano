module Pano
  module NumberHelper

    def clean_round(x, precision = 0)
      number_with_precision x, precision: precision, strip_insignificant_zeros: true
    end

    # shorthand for number_with_delimiter.
    def delimit(number, options = {})
      number_with_delimiter number, options
    end

    def delimited_pluralize(number, label)
      if number == 1
        "1 #{label}"
      else
        "#{delimit number} #{label.pluralize}"
      end
    end

    # Add a + before a positive integer
    def explicit_integer(integer)
      integer.positive? ? "+#{integer}" : integer.to_s
    end

    def not_zero(number)
      (number.nil? || number.zero?) ? '' : delimit(number)
    end

    def percent(numerator, denominator, decimal_digits = nil)
      return 0 if denominator == 0
      return ((numerator.to_f / denominator.to_f) * 100.0).round(decimal_digits) if decimal_digits
      ((numerator.to_f / denominator.to_f) * 100.0).round
    end
  end
end
