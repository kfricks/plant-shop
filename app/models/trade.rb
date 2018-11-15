class Trade < ApplicationRecord
  belongs_to :user_a, class_name: 'User', foreign_key: 'user_a_id'
  belongs_to :user_b, class_name: 'User', foreign_key: 'user_b_id'

  has_many :trade_components
  has_many :plants, through: :trade_components

  def plants_being_given(user)
    plants.where(user: user)
  end

  def plants_being_received(user)
    plants.where.not(user: user)
  end

  def other_users_name(current_user)
   if current_user == user_a
      user_b.name
    else
      user_a.name
    end
  end
end

