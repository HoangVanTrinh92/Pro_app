class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    alias_action :create, :update, :destroy, to: :cud

    if user.role == "admin"
      can :manage, :all
    elsif user.role == "normal"
      can :manage, :all
      cannot :cud, Book
    end
  end
end
