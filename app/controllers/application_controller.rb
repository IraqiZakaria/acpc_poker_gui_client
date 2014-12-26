require_relative '../../lib/application_defs'

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :layout
  before_filter :authenticate_user!

  def self.report_error_request_message
    "please report this incident on the issue tracker, #{ApplicationDefs::ISSUE_TRACKER}"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
