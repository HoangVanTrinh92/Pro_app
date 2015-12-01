class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    alias_action :create, :update, :destroy, to: :cud

    if user.admin?
      can :manage, :all
    elsif user.normal?
      can :manage, :all
      cannot :cud, Books
    else
      can :read, :all
    end
  end
end
