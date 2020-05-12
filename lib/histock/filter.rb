require 'histock/simplefilter'
require File.expand_path(File.dirname(__FILE__)) + '/filter/version'
require File.expand_path(File.dirname(__FILE__)) + '/filter/helper'

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

                parse(table)
            end
        end

        CONFIG.last.each do |method_name|
            define_method method_name do |param, param2|
                raise ArgumentError if param2 == 'month'

                histock = Histock::Simplefilter.new
                table = histock.send(method_name, param, param2)

                parse(table)
            end
        end

        private

        def parse(table)
            list = table[1..-1].map { |e| table.first.zip(e).to_h }

            list.each do |hash|
                hash.each do |key, val|
                    if Histock::Helper.is_persentage?(val)
                        hash[key] = Histock::Helper.persentage_to_number(val)
                    elsif Histock::Helper.is_currency?(val)
                        hash[key] = Histock::Helper.currency_to_number(val)
                    end
                end
            end

            list
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
