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
      can :manage, Product do |product|
        product.product_requests.map(&:user_id).include? user.id
      end
      can :create, Product
      can :create, ProductRequest
      can :destroy, ProductRequest, user_id: user.id
      can :read, Dashboard
    else
      can :read, Product
    end
  end
end
