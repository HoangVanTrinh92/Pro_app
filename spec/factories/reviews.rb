FactoryGirl.define do
  factory :review do
    user_id {rand(2..51)}
    book_id {rand(1..105)}
    content {Faker::Lorem.sentence}
    state {[:like, :unlike].sample}
  end
end
