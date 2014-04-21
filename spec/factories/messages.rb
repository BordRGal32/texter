# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message, :class => Message do
    to "5036102940"
    from "8027780526"
    body Faker::Company.bs
  end
end
