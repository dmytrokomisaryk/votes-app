FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Smith'
    email 'john@example.com'
    password '123456'
    password_confirmation '123456'
  end
end
