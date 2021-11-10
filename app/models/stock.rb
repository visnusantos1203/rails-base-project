class Stock < ApplicationRecord
  serialize :price_history, Array

  validates :symbol, :company_name, :description, :logo_url, :price_history, presence: true
  has_many :payments
end
