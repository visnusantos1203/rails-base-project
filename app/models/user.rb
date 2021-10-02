class User < ApplicationRecord
  has_many :payments
  has_one :wallet, dependent: :destroy

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, :username, presence: true
  after_save :create_user_wallet, :send_welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  private 

  def send_welcome_email
    WelcomeMailer.welcome_email(email).deliver_now if approved == false
    WelcomeMailer.welcome_email(email).deliver_now if approved == true
  end

  def create_user_wallet
    user_wallet = Wallet.create(user_id: User.last.id, balance: 100_000)
  end

end
