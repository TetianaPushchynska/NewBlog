class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
