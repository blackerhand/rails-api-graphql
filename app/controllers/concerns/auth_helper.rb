# helpers for sign grape
module AuthHelper
  def current_user
    return @current_user if @current_user.present?
    return if request.headers['Authorization'].blank?

    payload       = Svc::JwtSignature.verify!(request.headers['Authorization']).first
    @current_user = User.find_by(id: payload['id'])
  end
end
