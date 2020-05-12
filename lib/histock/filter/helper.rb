module Histock
    class Helper
        class << self
            def is_persentage?(str)
                str.match(/^[+-]?([0-9]+(\.[0-9]*)?|\.[0-9]+)%$/).nil? ? false : true
            end

            def is_currency?(str)
                str.match(/^[+-]?\d{1,3}(,\d{3})*$/).nil? ? false : true
            end

            # should check str by 'is_persentage?' method before calling this method
            def persentage_to_number(str)
                str.to_s.gsub(/%/,'').to_f
            end

            # should check str by 'is_currency?' method before calling this method
            def currency_to_number(str)
                str.to_s.gsub(/[$,]/,'').to_i
            end
        end
    end
end
