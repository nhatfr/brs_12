class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :book_users, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :like_unlikes, dependent: :destroy
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
end
