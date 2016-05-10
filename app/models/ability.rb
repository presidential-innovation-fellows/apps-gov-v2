class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.type == "GovernmentUser"
      can :create, ProductRequest
      can :read, Dashboard
    elsif user.type == "ProductOwner"
      can :create, ProductRequest
      can :read, Dashboard
    else
      can :read, Product
    end
  end
end
