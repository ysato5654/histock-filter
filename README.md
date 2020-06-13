[![Gem Version](https://badge.fury.io/rb/histock-filter.svg)](https://badge.fury.io/rb/histock-filter)
[![Build Status](https://travis-ci.org/ysato5654/histock-filter.svg?branch=master)](https://travis-ci.org/ysato5654/histock-filter)
[![Coverage Status](https://coveralls.io/repos/github/ysato5654/histock-filter/badge.svg?branch=master)](https://coveralls.io/github/ysato5654/histock-filter?branch=master)

# Histock::Filter

histock-filter is Ruby library to get the finance data of listed stock on the Taiwan stock exchange market from [HiStock嗨投資理財社群](https://histock.tw/).

If you would like to get more basic data (row data), refer to [histock-simplefilter](https://github.com/ysato5654/histock-simplefilter).


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

### Dividend Policy

```rb
require 'histock/filter'

histock = Histock::Filter.new
histock.dividend_policy('2330')
# [
#   {
#     "所屬年度" => "2019",
#     "發放年度" => "2020",
#     "除權日" => "",
#     "除息日" => "06/18",
#     "除權息前股價" => 297.5,
#     "股票股利" => 0,
#     "現金股利" => 2.5,
#     "EPS" => 13.32,
#     "配息率" => 18.77,
#     "現金殖利率" => 0.84,
#     "扣抵稅率" => 0.00,
#     "增資配股率" => 0,
#     "增資認購價" => 0
#   },
#   {},
#   :
# ]
```

### Basic Financial Statements

#### Monthly Revenue

| key | type |
|-----|------|
| 年度/月份 | string |
| 單月營收 | integer |
| 去年同月營收 | integer |
| 單月月增率 | float |
| 單月年增率 | float |
| 累計營收 | integer |
| 去年累計營收 | integer |
| 累積年增率 | float |

```rb
require 'histock/filter'

histock = Histock::Filter.new
histock.monthly_revenue('2330')
# [
#   {
#     "年度/月份" => "2020/04",
#     "單月營收" => 96001568,
#     "去年同月營收" => 74693616,
#     "單月月增率" => -15.4,
#     "單月年增率" => 28.5,
#     "累計營收" => 406598784,
#     "去年累計營收" => 293398112,
#     "累積年增率" => 38.6
#   },
#   {},
#   :
# ]
```

#### Income Statement

| key | type |
|-----|------|
| 年度/季別 | string |
| 營收 | integer |
| 毛利 | integer |
| 營業利益 | integer |
| 稅前淨利 | integer |
| 稅後淨利 | integer |

```rb
histock = Histock::Filter.new
histock.income_statement('2330')
# [
#   {
#     "年度/季別"" => "2019Q4",
#     "營收" => 317237065,
#     "毛利" => 159240985,
#     "營業利益" => 124243722,
#     "稅前淨利" => 128781973,
#     "稅後淨利" => 116078194
#   },
#   {},
#   :
# ]
```

### Profitability

#### Profit Ratio

| key | type |
|-----|------|
| 年度/季別 | string |
| 毛利率 | float |
| 營業利益率 | float |
| 稅前淨利率 | float |
| 稅後淨利率 | float |

```rb
histock = Histock::Filter.new
histock.profit_ratio('2330')
# [
#   {
#     "年度/季別" => "2019Q4",
#     "毛利率" => 50.20,
#     "營業利益率" => 39.16,
#     "稅前淨利率" => 40.59,
#     "稅後淨利率" => 36.59
#   },
#   {},
#   :
# ]
```

#### Income Rate

##### Monthly Data

| key | type |
|-----|------|
| 年度/季別 | string |
| ROE | float |
| ROA | float |

```rb
histock = Histock::Filter.new
histock.income_rate('2330', 'month')
# [
#   {
#     "年度/季別" => "2020Q1",
#     "ROE" => 7.10,
#     "ROA" => 5.08
#   },
#   {},
#   :
# ]
```

##### Quarterly Data

| key | type |
|-----|------|
| 年度/季別 | string |
| 近四季ROE | float |
| 近四季ROA | float |

```rb
histock = Histock::Filter.new
histock.income_rate('2330', 'quarter')
# [
#   {
#     "年度/季別" => "2020Q1",
#     "近四季ROE" => 23.45,
#     "近四季ROA" => 17.70
#   },
#   {},
#   :
# ]
```

##### Yearly Data

| key | type |
|-----|------|
| 年度 | string |
| 年度ROE | float |
| 年度ROA | float |

```rb
histock = Histock::Filter.new
histock.income_rate('2330', 'year')
# [
#   {
#     "年度" => "2019",
#     "年度ROE" => 20.93,
#     "年度ROA" => 15.86
#   },
#   {},
#   :
# ]
```

### Corporate Value

#### PER

| key | type |
|-----|------|
| 年度/月份 | string |
| 本益比 | float |

```rb
histock = Histock::Filter.new
histock.price_to_earning_ratio('2330')
# [
#   {
#     "年度/月份" => "2020/06",
#     "本益比" => 20.44
#   },
#   {},
#   :
# ]
```

#### PBR

| key | type |
|-----|------|
| 年度/月份 | string |
| 股價淨值比 | float |

```rb
histock = Histock::Filter.new
histock.price_book_ratio('2330')
# [
#   {
#     "年度/月份" => "2020/06",
#     "股價淨值比" => 4.89
#   },
#   {},
#   :
# ]
```
