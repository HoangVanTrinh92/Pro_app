FactoryGirl.define do
  factory :review do
    user_id {rand(2..51)}
    book_id {rand(1..50)}
    content {Faker::Lorem.sentence}
    rate {rand(1..5)}
  end
end
