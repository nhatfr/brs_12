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

# Follows a user.
  def follow other_user
    active_relationships.create(followed_id: other_user.id)
  end

# Unfollows a user.
  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
end
