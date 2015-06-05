class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :perusals, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships,
                       source: :followed
  has_many :followers, through: :passive_relationships,
                       source: :follower

  enum role: [:normal, :admin]
def feed
  following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
  Activity.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
end

  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def favorite book
    perusals.create book_id: book.id
  end

  def unfavorite book
    Perusal.find_by(user: self, book: book).destroy
  end

  def favorite? book
    Perusal.where(user: self, book: book).count > 0
  end

  def find_perusal book
    Perusal.find_by user: self, book: book
  end
end
