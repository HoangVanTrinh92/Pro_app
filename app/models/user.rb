class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :normal, ->{where role: "normal"}

  has_many :users, through: :relationships

  has_many :reviews, dependent: :destroy

  enum role: [:normal, :admin]
end
