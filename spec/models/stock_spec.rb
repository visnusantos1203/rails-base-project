require 'rails_helper'

RSpec.describe Stock, type: :model do
  context 'with validations' do
    it 'is not valid without symbol' do
      stock = described_class.new
      stock.symbol = nil
      stock.company_name = 'Apple Inc'
      stock.description = 'lorem ipsum'

      expect(stock).not_to be_valid
    end

    it 'is not valid without company name' do
      stock = described_class.new
      stock.symbol = 'AAPL'
      stock.company_name = nil
      stock.description = 'lorem ipsum'

      expect(stock).not_to be_valid
    end

    it 'is not valid without description' do
      stock = described_class.new
      stock.symbol = 'AAPL'
      stock.company_name = 'Apple Inc'
      stock.description = nil

      expect(stock).not_to be_valid
    end
  end
end
