require 'rails_helper'

RSpec.describe Payment, type: :model do
  context 'with validations' do
    it 'is not valid without user_id' do
      payment = described_class.new
      payment.quantity = 1
      payment.wallet_id = 1
      payment.stock_id = 100
      payment.current_price = 1
      payment.time_placed = Time.now
      payment.user_id = nil
      payment.transaction_type = 1

      expect(payment).not_to be_valid
    end

    it 'is not valid without wallet_id' do
      payment = described_class.new
      payment.quantity = 1
      payment.wallet_id = nil
      payment.stock_id = 100
      payment.current_price = 1
      payment.time_placed = Time.now
      payment.user_id = 1
      payment.transaction_type = 1

      expect(payment).not_to be_valid
    end

    it 'is not valid without stock_id' do
      payment = described_class.new
      payment.quantity = 1
      payment.wallet_id = 1
      payment.stock_id = nil
      payment.current_price = 1
      payment.time_placed = Time.now
      payment.user_id = 1
      payment.transaction_type = 1

      expect(payment).not_to be_valid
    end

    it 'is not valid without quantity' do
      payment = described_class.new
      payment.quantity = nil
      payment.wallet_id = 1
      payment.stock_id = 100
      payment.current_price = 1
      payment.time_placed = Time.now
      payment.user_id = 1
      payment.transaction_type = 1

      expect(payment).not_to be_valid
    end

    it 'is not valid without current_price' do
      payment = described_class.new
      payment.quantity = 1
      payment.wallet_id = 1
      payment.stock_id = 100
      payment.current_price = nil
      payment.time_placed = Time.now
      payment.user_id = 1
      payment.transaction_type = 1

      expect(payment).not_to be_valid
    end

    it 'is not valid without time_placed' do
      payment = described_class.new
      payment.quantity = 1
      payment.wallet_id = 1
      payment.stock_id = 100
      payment.current_price = 1
      payment.time_placed = nil
      payment.user_id = 1
      payment.transaction_type = 1

      expect(payment).not_to be_valid
    end

    it 'is not valid without transaction_type' do
      payment = described_class.new
      payment.quantity = 1
      payment.wallet_id = 1
      payment.stock_id = 100
      payment.current_price = 1
      payment.time_placed = Time.now
      payment.user_id = 1
      payment.transaction_type = nil

      expect(payment).not_to be_valid
    end
  end
end
