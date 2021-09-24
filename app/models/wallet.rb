class Wallet < ApplicationRecord
  validates :id, :updated_at, :created_at, :user_id, presence: true
  belongs_to :user
  has_many :payments
end
