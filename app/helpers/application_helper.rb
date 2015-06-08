module ApplicationHelper
  def full_title page_title = ""
    base_title = t :app_name
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def user_like_activity? user, activity
    Like.find_by(user_id: user.id, activity_id: activity.id).blank?
  end
end
