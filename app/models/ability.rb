class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.type == "GovernmentUser"
      can :create, ProductRequest
    elsif user.type == "ProductOwner"
      can :create, ProductRequest
    else
      can :read, :all
    end
  end
end
