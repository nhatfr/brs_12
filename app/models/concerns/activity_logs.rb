module ActivityLogs
  def create_activity action, target_id, user_id
    Activity.create action: action, target_id: target_id, user_id: user_id
  end
end
