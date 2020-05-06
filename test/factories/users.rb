FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "firstname#{n}" }
    sequence(:last_name) { |n| "lastname#{n}" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:avatar) { |n| "avatar#{n}" }
    sequence :type do |n|
      if n = 1 and n % 3 = 1 
        'admin'
      elsif n = 2 and n % 3 = 2
        'developer'
      else
        'manager'
      end
    end
  end
end
