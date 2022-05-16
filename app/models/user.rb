require 'csv'

class User < ApplicationRecord
  has_many :payments
  has_one :wallet, dependent: :destroy

  validates :first_name, :last_name, :username, presence: true
  after_save :create_user_wallet #, :send_welcome_email << apparently this causes the deployed app to malfunction upon user admin approval. Removing this line of code also removes user and admin signout bug

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :asc_name, -> { order("users.first_name ASC ")}
  scope :desc_name, -> { order("users.first_name DESC ")}

  def self.to_csv
    attributes = %W{id email first_name last_name username approved}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map { |attr| user.send(attr) }
      end
    end
  end

  private 

  def send_welcome_email
    WelcomeMailer.welcome_email(email).deliver_now
  end

  def create_user_wallet
    if wallet == nil
      user_wallet = Wallet.create!(id: id, user_id: id, balance: 100_000, created_at: Time.now, updated_at: Time.now)
    end
  end

end
