class Like < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  ATTRIBUTES_PARAMS = [:user_id, :book_id]

  scope :like, ->{where(state: :like)}
  scope :unlike, ->{where(state: :unlike)}
  after_create :update_relationship

  state_machine :state, initial: :unlike do
    event :like do
      transition unlike: :like
    end

    event :unlike do
      transition like: :unlike
    end
  end

  def update_relationship
    User.all.each do |user1|
      User.all.each do |user2|

        user1_book_id = user1.likes.pluck(:book_id)
        user2_book_id = user2.likes.pluck(:book_id)

        result = user2_book_id & user1_book_id

        relation = Relationship.where(user1_id: user1.id, user2_id: user2.id).first

        relation.update_attributes relation: result.length if relation
      end
    end
  end
end
