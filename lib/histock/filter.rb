require 'histock/simplefilter'
require File.expand_path(File.dirname(__FILE__)) + '/filter/version'
require File.expand_path(File.dirname(__FILE__)) + '/filter/helper'

module Histock
    class Filter
        CONFIG = [
            # one argument
            [
                'monthly_revenue',
                'income_statement',
                'dividend_policy',
                'profit_ratio',
                'price_to_earning_ratio',
                'price_book_ratio'
            ],
            # two arguments
            [
                'income_rate'
            ]
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
                    elsif Histock::Helper.is_float?(val)
                        hash[key] = val.to_f
                    end
                end
            end

            list
        end
    end
end
