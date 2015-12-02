class Relationship < ActiveRecord::Base
  belongs_to :user, class_name: "User"

  validates :user1_id, presence: true
  validates :user2_id, presence: true
end
