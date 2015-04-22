require_relative '../../lib/application_defs'

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :layout
  before_filter :authenticate_user!

  def self.issue_tracker
    'https://github.com/dmorrill10/acpc_poker_gui_client/issues?state=open'
  end
  def self.report_error_request_message
    "please report this incident on the issue tracker, #{issue_tracker}"
  end

  def self.help_link_html_class() 'help_link' end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password,
                                   :password_confirmation, :first_name,
                                   :last_name, :country, :age, :ethnicity,
                                   :highest_level_of_qualification,
                                   :poker_experience)
    end

  protected
    def authenticate_inviter!
      if current_user.present? && current_user.admin
        current_user
      else
        redirect_to :root, notify: 'Only admins can send invites'
      end
    end

    def authorize_admin
      redirect_to root_path, alert: 'Access Denied' unless current_user.present? && current_user.admin?
    end
end
