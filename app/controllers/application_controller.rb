class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end 
  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    root_path
  end 

  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email]) # 新規登録時(sign_up時)にname,emailというキーのパラメーターを追加で許可する
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email]) # ログイン時(sign_in時)にnameというキーのパラメーターを追加で許可する
  end

end
