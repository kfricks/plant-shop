class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :plants
  has_many :trades_as_user_a, foreign_key: :user_a_id, class_name: "Trade"
  has_many :trades_as_user_b, foreign_key: :user_b_id, class_name: "Trade"

  def name
    "#{first_name} #{last_name}"
  end
end
