class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :normal, ->{where role: "normal"}

  has_many :users, through: :relationships
  has_many :likes, dependent: :destroy
  has_many :books, through: :likes
  has_many :reviews, dependent: :destroy

  enum role: [:normal, :admin]

  after_create :make_relationship

  relationships = Relationship.all

  def show_wishes
    wishes = Like.all.each_with_object([]) do |wish, obje|
      obje << wish.book_id if wish.user_id == self.id
    end
  end

  def show_suggest_user level=10
    relations = Relationship.all.each_with_object([]) do |r, obj|
      obj << r if r.user1_id == self.id || r.user2_id == self.id
    end
    sort_relations = relations.sort_by {|s| s.relation}
    top_relation = sort_relations.reverse.take(level)
    find_user1 = top_relation.collect{|user1| user1.user1_id}
    find_user2 = top_relation.collect{|user2| user2.user2_id}
    all_top = find_user1 + find_user2
    current_user_id = self.id
    all_top.delete(current_user_id)

    book_ids = User.where(id: current_user_id).each_with_object([]) do |user, obj|
      obj << user.likes.pluck(:book_id)
    end

    count_books = book_ids.flatten.uniq.each_with_object([]) do |most_book, obje|
      obje << [book_ids.flatten.count(most_book), most_book]
    end
    count_books.sort.reverse.take(5).flatten.select.each_with_index { |_,i| i % 2 == 1 }
  end

  def curr_user
    User.find_by(id: self.id)
  end

  private
  def make_relationship
    User.all.each do |user|
      Relationship.create user1_id: self.id, user2_id: user.id, relation: 0 unless user == self
    end
  end
end
