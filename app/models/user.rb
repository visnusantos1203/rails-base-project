class User < ApplicationRecord
  has_many :payments
  has_one :wallet, dependent: :destroy

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, :username, presence: true
  after_save :create_user_wallet

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :asc_name, -> { order("users.first_name ASC ")}
  scope :desc_name, -> { order("users.first_name DESC ")}

  private 

  def send_welcome_email
    WelcomeMailer.welcome_email(email).deliver_now
  end

  def create_user_wallet
    if wallet == nil
      user_wallet = Wallet.new(id: id, user_id: id, balance: 100_000, created_at: Time.now, updated_at: Time.now)
      user_wallet.save
    end
  end

end
