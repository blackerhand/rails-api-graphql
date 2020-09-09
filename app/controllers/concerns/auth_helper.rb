# helpers for sign grape
module AuthHelper
  def current_user
    return if request.headers['Authorization'].blank?

    payload = Svc::JwtSignature.verify!(request.headers['Authorization']).first
    User.find_by(id: payload['id'])
  rescue JwtSignature::SignError
    nil
  end
end
