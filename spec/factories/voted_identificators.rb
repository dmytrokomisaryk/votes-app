# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :voted_identificator do
    poll_id 1
    user_identificator "MyText"
  end
end
