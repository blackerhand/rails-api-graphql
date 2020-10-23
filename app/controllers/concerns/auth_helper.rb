# helpers for sign grape
module AuthHelper
  def current_user
    return @current_user if @current_user.present?
    return if request.headers['Authorization'].blank?

    payload                        = Svc::JwtSignature.verify!(request.headers['Authorization']).first
    @current_user                  = User.find_by(id: payload['id'])
    ::PaperTrail.request.whodunnit = @current_user.id if @current_user.present?

    @current_user
  end

  def required_login!
    render(json: { errors: [{ message: 'please login', i18n_message: '请登录', code: 401 }] }, status: 401) if current_user.nil?
  end
end
