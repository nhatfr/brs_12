class Request < ActiveRecord::Base
  belongs_to :user

  before_create :set_default_status

  enum status: [:pending, :accepted, :rejected]

  def set_default_status
    self.status ||= :pending
  end

  Settings.request.states.each do |method|
    define_method("#{method}?") {status == method.to_s}
  end
end
