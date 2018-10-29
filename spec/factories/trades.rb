FactoryBot.define do
  factory :trade do
    user_a { 1 }
    user_b { 1 }
    shipping_label_user_a { "MyString" }
    shipping_label_user_b { "MyString" }
    status { "MyString" }
  end
end
