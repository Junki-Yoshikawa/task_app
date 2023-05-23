class ApplicationController < ActionController::Base

  include ExceptionHandler

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def ta_t(k)
    I18n.t("labels.#{controller_name}.#{action_name}.#{k}")
  end
end
