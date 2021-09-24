class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  # validates :first_name, :last_name, :username, :user_type, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # has_and_belongs_to_many :roles
  has_many :payments
  has_many :wallets
end
