class Stock < ApplicationRecord
  validates :symbol, :company_name, :description, presence: true
  has_many :payments
end
