require 'histock/simplefilter'
require File.expand_path(File.dirname(__FILE__)) + '/filter/version'

module Histock
    class Filter
        CONFIG = [
            ['monthly_revenue', 'income_statement', 'dividend_policy', 'profit_ratio'], # one argument
            ['income_rate']                                                             # two arguments
        ]

        def initialize
        end

        CONFIG.first.each do |method_name|
            define_method method_name do |param|
                histock = Histock::Simplefilter.new
                table = histock.send(method_name, param)

                table[1..-1].map { |e| table.first.zip(e).to_h }
            end
        end

        CONFIG.last.each do |method_name|
            define_method method_name do |param, param2|
                raise ArgumentError if param2 == 'month'

                histock = Histock::Simplefilter.new
                table = histock.send(method_name, param, param2)

                table[1..-1].map { |e| table.first.zip(e).to_h }
            end
        end
    end

    class Error < StandardError
    end

    class ArgumentError < Error

        attr_reader :message

        def initialize
            @message = 'currently not supported'
        end
    end
end
