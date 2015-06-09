class RatingCache < ActiveRecord::Base
  belongs_to :cacheable, polymorphic: true

  scope :content_rate, ->book {where cacheable_id: book.id, dimension: Settings.rate.content}
  scope :design_rate, ->book {where cacheable_id: book.id, dimension: Settings.rate.design}
end
