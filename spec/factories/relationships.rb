FactoryGirl.define do
  factory :relationship do
    user1_id {rand(2..51)}
    user2_id {rand(2..51)}
    relation {rand(1..10)}
  end
end
