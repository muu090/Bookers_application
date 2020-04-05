class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email]) # 新規登録時(sign_up時)にname,emailというキーのパラメーターを追加で許可する
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name]) # ログイン時(sign_in時)にnameというキーのパラメーターを追加で許可する
  end

end
