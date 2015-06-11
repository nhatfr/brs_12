class Rate < ActiveRecord::Base
  belongs_to :rater, class_name: "User"
  belongs_to :rateable, polymorphic: true

  scope :content_raters, ->book {where rateable_id: book.id, dimension: Settings.rate.content}
  scope :design_raters, ->book {where rateable_id: book.id, dimension: Settings.rate.design}
end
