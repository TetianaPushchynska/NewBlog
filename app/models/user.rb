class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  enum role: %i[guest registered manager admin]

  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def full_name
    (first_name + ' ' + last_name)
  end
end
