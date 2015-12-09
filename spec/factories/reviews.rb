FactoryGirl.define do
  factory :review do
    user_id {rand(2..22)}
    book_id {rand(1..40)}
    content {Faker::Lorem.sentence}
    state {[:like, :unlike].sample}
  end
end
