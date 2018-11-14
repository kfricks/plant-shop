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

end

# PUT THIS IN A JOB
# SET UP ACTIVEJOB
# DO NOT SET UP REDIS AND SIDEQICK
# USE ASYNC ACTIVE JOB QUEUE
# Plant Trade Job -- moves plants from one user to the other
# user_a_plants = trade.plants_being_given(trade.user_a)
# user_b_plants = trade.plants_being_given(trade.user_b)

# user_a_plants.update_all(user: trade.user_b)
# user_b_plants.update_all(user: trade.user_a)