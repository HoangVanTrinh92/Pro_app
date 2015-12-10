FactoryGirl.define do
  factory :like do
    user_id {rand(2..22)}
    book_id {rand(1..40)}
    state {[:like, :unlike].sample}
  end
end
