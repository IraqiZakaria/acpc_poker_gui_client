require_relative '../../lib/application_defs'

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :layout
  before_filter :authenticate_user!

  def self.report_error_request_message
    "please report this incident on the issue tracker, #{ApplicationDefs::ISSUE_TRACKER}"
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
      if current_user.admin == false
        redirect_to :root, notify: 'Only admins can send invites'
      else
        super
      end
    end
end
