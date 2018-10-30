class Trade < ApplicationRecord
  belongs_to :user_a, class_name: 'User', foreign_key: 'user_id'
  belongs_to :user_b, class_name: 'User', foreign_key: 'user_id'
end
