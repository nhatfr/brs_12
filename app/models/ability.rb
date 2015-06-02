class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.normal?
      can [:create, :update, :destroy], [Review, Comment, Request, Activity], user_id: user.id
      can :update, User, id: user.id
    end
  end
end
