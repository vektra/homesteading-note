# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    content "MyText"
    in_reply_to "MyText"
    private false
  end
end
