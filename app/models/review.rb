class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  validates :content, presence: true

  after_create :update_relationship

  def update_relationship
    User.all.each do |user1|
      User.all.each do |user2|

        user1_book_id = user1.reviews.pluck(:book_id)
        user2_book_id = user2.reviews.pluck(:book_id)

        result = user2_book_id & user1_book_id

        relation = Relationship.where(user1_id: user1.id, user2_id: user2.id).first

        relation.update_attributes relation: result.length if relation
      end
    end
  end
end
