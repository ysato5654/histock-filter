[![Gem Version](https://badge.fury.io/rb/histock-filter.svg)](https://badge.fury.io/rb/histock-filter)
[![Build Status](https://travis-ci.org/ysato5654/histock-filter.svg?branch=master)](https://travis-ci.org/ysato5654/histock-filter)

# Histock::Filter

[HiStock嗨投資理財社群](https://histock.tw/) filter by Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'histock-filter'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install histock-filter
```

## Usage

```rb
histock = Histock::Filter.new
histock.dividend_policy('1234')
# [
#   {"所屬年度" => "2019", "發放年度" => "2020", "除權日" => "", "除息日" => "06/18", "除權息前股價" => "297.5", "股票股利" => "0", "現金股利" => "2.5", EPS" => "13.32", "配息率" => "18.77%", "現金殖利率" => "0.84%", "扣抵稅率" => "0.00%", "增資配股率" => "0", "增資認購價" => "0"},
#   {"所屬年度" => "2019", "發放年度" => "2020", "除權日" => "", "除息日" => "03/19", "除權息前股價" => "260", "股票股利" => "0", "現金股利" => "2.5", "EPS" => "13.32", "配息率" => "18.77%", "現金殖利率" => "0.96%", "扣抵稅率" => "0.00%", "增資配股率" => "0", "增資認購價" => "0"},
#   {"所屬年度" => "2018", "發放年度" => "2019", "除權日" => "", "除息日" => "12/19", "除權息前股價" => "344.5", "股票股利" => "0", "現金股利" => "2.5", "EPS" => "13.54", "配息率" => "18.46%", "現金殖利率" => "0.73%", "扣抵稅率" => "0.00%", "增資配股率" => "0", "增資認購價" => "0"},
#   {"所屬年度" => "2018", "發放年度" => "2019", "除權日" => "", "除息日" => "09/19", "除權息前股價" => "267", "股票股利" => "0", "現金股利" => "2", "EPS" => "13.54", "配息率" => "14.77%", "現金殖利率" => "0.75%", "扣抵稅率" => "0.00%", "增資配股率" => "0", "增資認購價" => "0"},
# ]
```
