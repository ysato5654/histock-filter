require 'histock/simplefilter'
require File.expand_path(File.dirname(__FILE__)) + '/filter/version'

module Histock
    class Filter
        CONFIG = ['dividend_policy', 'financial_statements']

        def initialize
        end

        CONFIG.each do |method_name|
            define_method method_name do |param|
                histock = Histock::Simplefilter.new
                table = histock.send(method_name, param)

                table[1..-1].map { |e| table.first.zip(e).to_h }
            end
        end
    end
end
