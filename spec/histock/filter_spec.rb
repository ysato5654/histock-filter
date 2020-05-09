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

    describe '#financial_statements(code)' do
        subject do
            histock.financial_statements(code)
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
end
