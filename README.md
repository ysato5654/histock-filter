[![Gem Version](https://badge.fury.io/rb/histock-filter.svg)](https://badge.fury.io/rb/histock-filter)
[![Build Status](https://travis-ci.org/ysato5654/histock-filter.svg?branch=master)](https://travis-ci.org/ysato5654/histock-filter)
[![Coverage Status](https://coveralls.io/repos/github/ysato5654/histock-filter/badge.svg?branch=master)](https://coveralls.io/github/ysato5654/histock-filter?branch=master)

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

### Dividend policy

```rb
histock = Histock::Filter.new
histock.dividend_policy('2330')
# [
#   {"所屬年度" => "2019", "發放年度" => "2020", "除權日" => "", "除息日" => "06/18", "除權息前股價" => "297.5", "股票股利" => "0", "現金股利" => "2.5", EPS" => "13.32", "配息率" => "18.77%", "現金殖利率" => "0.84%", "扣抵稅率" => "0.00%", "增資配股率" => "0", "增資認購價" => "0"},
#   {"所屬年度" => "2019", "發放年度" => "2020", "除權日" => "", "除息日" => "03/19", "除權息前股價" => "260", "股票股利" => "0", "現金股利" => "2.5", "EPS" => "13.32", "配息率" => "18.77%", "現金殖利率" => "0.96%", "扣抵稅率" => "0.00%", "增資配股率" => "0", "增資認購價" => "0"},
#   {"所屬年度" => "2018", "發放年度" => "2019", "除權日" => "", "除息日" => "12/19", "除權息前股價" => "344.5", "股票股利" => "0", "現金股利" => "2.5", "EPS" => "13.54", "配息率" => "18.46%", "現金殖利率" => "0.73%", "扣抵稅率" => "0.00%", "增資配股率" => "0", "增資認購價" => "0"},
#   {"所屬年度" => "2018", "發放年度" => "2019", "除權日" => "", "除息日" => "09/19", "除權息前股價" => "267", "股票股利" => "0", "現金股利" => "2", "EPS" => "13.54", "配息率" => "14.77%", "現金殖利率" => "0.75%", "扣抵稅率" => "0.00%", "增資配股率" => "0", "增資認購價" => "0"},
# ]
```

### Financial statements

```rb
histock = Histock::Simplefilter.new
histock.financial_statements('2330')
# [
#   {"年度/月份" => "2020/04", "單月營收" => "96,001,568", "去年同月營收" => "74,693,616", "單月月增率" => "-15.4%", "單月年增率" => "28.5%", "累計營收" => "406,598,784", "去年累計營收" => "293,398,112", "累積年增率" => "38.6%"},
#   {"年度/月份" => "2020/03", "單月營收" => "113,519,600", "去年同月營收" => "79,721,584", "單月月增率" => "21.5%", "單月年增率" => "42.4%", "累計營收" => "310,597,184", "去年累計營收" => "218,704,496", "累積年增率" => "42%"},
#   {"年度/月份" => "2020/02", "單月營收" => "93,394,448", "去年同月營收" => "60,889,060", "單月月增率" => "-9.9%", "單月年增率" => "53.4%", "累計營收" => "197,077,600", "去年累計營收" => "138,982,896", "累積年增率" => "41.8%"},
#   {"年度/月份" => "2020/01", "單月營收" => "103,683,104", "去年同月營收" => "78,093,824", "單月月增率" => "0.3%", "單月年增率" => "32.8%", "累計營收" => "103,683,104", "去年累計營收" => "78,093,824", "累積年增率" => "32.8%"},
#   {"年度/月份" => "2019/12", "單月營收" => "103,313,104", "去年同月營收" => "89,830,600", "單月月增率" => "-4.2%", "單月年增率" => "15%", "累計營收" => "1,069,985,024", "去年累計營收" => "1,031,473,984", "累積年增率" => "3.7%"}
# ]
```
