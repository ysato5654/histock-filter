RSpec.describe Histock::Filter do
    it 'has a version number' do
        expect(Histock::Filter::VERSION).not_to be nil
    end

    let :histock do
        Histock::Filter.new
    end

    let :code do
        '2330'
    end

    describe '#monthly_revenue(code)' do
        subject do
            histock.monthly_revenue(code)
        end

        let :keys do
            ["年度/月份", "單月營收", "去年同月營收", "單月月增率", "單月年增率", "累計營收", "去年累計營收", "累積年增率"]
        end

        describe 'key' do
            it 'is correct' do
                expect(subject.first.keys).to eq(keys)
                expect(subject.last.keys).to eq(keys)
            end
        end
    end

    describe '#income_statement(code)' do
        subject do
            histock.income_statement(code)
        end

        let :keys do
            ["年度/季別", "營收", "毛利", "營業利益", "稅前淨利", "稅後淨利"]
        end

        describe 'key' do
            it 'is correct' do
                expect(subject.first.keys).to eq(keys)
                expect(subject.last.keys).to eq(keys)
            end
        end
    end

    describe '#dividend_policy(code)' do
        subject do
            histock.dividend_policy(code)
        end

        let :keys do
            ["所屬年度", "發放年度", "除權日", "除息日", "除權息前股價", "股票股利", "現金股利", "EPS", "配息率", "現金殖利率", "扣抵稅率", "增資配股率", "增資認購價"]
        end

        describe 'key' do
            it 'is correct' do
                expect(subject.first.keys).to eq(keys)
                expect(subject.last.keys).to eq(keys)
            end
        end
    end

    describe '#profit_ratio(code)' do
        subject do
            histock.profit_ratio(code)
        end

        let :keys do
            ["年度/季別", "毛利率", "營業利益率", "稅前淨利率", "稅後淨利率"]
        end

        describe 'key' do
            it 'is correct' do
                expect(subject.first.keys).to eq(keys)
                expect(subject.last.keys).to eq(keys)
            end
        end
    end

    describe '#income_rate(code, term)' do
        subject do
            histock.income_rate(code, term)
        end

        describe 'term is month' do
            let :keys do
                ["年度/季別", "ROE", "ROA"]
            end

            let :term do
                'month'
            end

            describe 'key' do
                it 'is correct' do
                    expect(subject.first.keys).to eq(keys)
                    expect(subject.last.keys).to eq(keys)
                end
            end
        end

        describe 'term is quarter' do
            let :keys do
                ["年度/季別", "近四季ROE", "近四季ROA"]
            end

            let :term do
                'quarter'
            end

            describe 'key' do
                it 'is correct' do
                    expect(subject.first.keys).to eq(keys)
                    expect(subject.last.keys).to eq(keys)
                end
            end
        end

        describe 'term is year' do
            let :keys do
                ["年度", "年度ROE", "年度ROA"]
            end

            let :term do
                'year'
            end

            describe 'key' do
                it 'is correct' do
                    expect(subject.first.keys).to eq(keys)
                    expect(subject.last.keys).to eq(keys)
                end
            end
        end
    end

    describe '#price_to_earning_ratio(code)' do
        subject do
            histock.price_to_earning_ratio(code)
        end

        let :keys do
            ["年度/月份", "本益比"]
        end

        describe 'key' do
            it 'is correct' do
                expect(subject.first.keys).to eq(keys)
                expect(subject.last.keys).to eq(keys)
            end
        end
    end

    describe '#price_book_ratio(code)' do
        subject do
            histock.price_book_ratio(code)
        end

        let :keys do
            ["年度/月份", "股價淨值比"]
        end

        describe 'key' do
            it 'is correct' do
                expect(subject.first.keys).to eq(keys)
                expect(subject.last.keys).to eq(keys)
            end
        end
    end

    describe '#company_profile(code)' do
        subject do
            histock.company_profile(code)
        end

        let :keys do
            ["成立日期", "董事長", "總經理", "公開發行日期", "實收資本額", "已發行普通股", "統一編號", "本益比", "內銷比重", "外銷比重", "股價淨值比", "現金殖利率"]
        end

        describe 'key' do
            it 'is correct' do
                expect(subject.keys).to eq(keys)
            end
        end
    end
end
