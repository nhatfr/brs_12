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

  ratyrate_rater

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

  def like activity
    Like.create user_id: self.id, activity_id: activity.id
  end
  
  def read book, status
    record = Reading.find_or_initialize_by(user: self, book: book)
    record.update status: Reading.statuses[status]
  end

  def unread book
    Reading.find_by(user: self, book: book).destroy
  end

  def find_reading book
    Reading.find_by user: self, book: book
  end

  def reading? book
    Reading.where(user: self, book: book, status: Settings.statuses.reading).count > 0
  end

  def read? book
    Reading.where(user: self, book: book, status: Settings.statuses.read).count > 0
  end
end
