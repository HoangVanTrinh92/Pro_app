class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    alias_action :create, :update, :destroy, to: :cud

    if user.role?
      can :manage, :all
    else
      can :manage, :all
      cannot :cud, Books
    end
  end
end
