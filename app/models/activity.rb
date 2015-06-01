class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy

  enum action: Settings.actions
end
