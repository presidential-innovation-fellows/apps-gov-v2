class RoleRouteConstraint
  def initialize(type)
    @type = type
  end

  def matches?(request)
    if user_session_id(request)
      user = User.find_by_id(user_session_id(request))
      user.present? && (user.admin? || user.type_sym == @type.to_sym)
    end
  end

  private

  def user_session_id(request)
    if request.session["warden.user.#{@type}.key"].present?
      request.session["warden.user.#{@type}.key"][0][0]
    end
  end
end
