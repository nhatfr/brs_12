class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.normal?
      can [:create, :update, :destroy], [Review, Comment, Request, Activity], user_id: user.id
      can :read, Review
      can :update, User, id: user.id
      can :read, Book
      can :read, User
      can [:create, :destroy], Relationship
      can [:create, :destroy], Perusal
      can [:create, :destroy], Like
      can :manage, Reading
      can :manage, Request, user_id: user.id
    end
  end
end
