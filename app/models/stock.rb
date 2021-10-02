class Stock < ApplicationRecord
  validates :symbol, :company_name, :description, :logo_url, presence: true
  has_many :payments
end
