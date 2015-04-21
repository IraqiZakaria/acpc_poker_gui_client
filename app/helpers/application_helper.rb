require 'acpc_poker_types'

# General controller/view helpers for this application.
module ApplicationHelper
  APP_NAME = 'ACPC Poker GUI Client' unless const_defined? :APP_NAME

  NEW_MATCH_PARTIAL = 'match_start/index' unless const_defined? :NEW_MATCH_PARTIAL
  FOOTER = 'match_start/footer' unless const_defined? :FOOTER
  REPLACE_CONTENTS_JS = 'shared/replace_contents' unless const_defined? :REPLACE_CONTENTS_JS

  def wait_for_match_to_start_partial() 'match_start/wait_for_match_to_start' end

  # Renders a shared +JavaScript+ template that replaces the old contents
  # of the current page with new contents. In essence, it acts like a
  # page refresh.
  # @param [String] replacement_partial The partial with which the page should be replaced.
  # @param [String] alert_message An alert message to be displayed.
  def replace_page_contents(replacement_partial, alert_message=@alert_message)
    @alert_message = alert_message

    Rails.logger.fatal({method: __method__, alert_message: @alert_message}.awesome_inspect)

    @replacement_partial = replacement_partial
    if (
      error? do
        respond_to do |format|
          format.js do
            render REPLACE_CONTENTS_JS, formats: [:js]
          end
        end
      end
    )
      @alert_message ||= "Unable to update the page, #{self.class.report_error_request_message}"
      if replacement_partial == NEW_MATCH_PARTIAL
        return(redirect_to(root_path, remote: true))
      else
        return reset_to_match_entry_view
      end
    end
  end

  def reset_to_match_entry_view(error_message=@alert_message)
    replace_page_contents NEW_MATCH_PARTIAL, error_message
  end

  def link_with_glyph(link_text, link_target, glyph, options={})
    link_to link_target, options do
      inserted_html = "#{content_tag(:i, nil, class: 'icon-' << glyph)} #{link_text}".html_safe
      inserted_html << yield if block_given?
      inserted_html
    end
  end

  def log_error(e)
    Rails.logger.fatal({exception: {message: e.message, backtrace: e.backtrace}}.awesome_inspect)
  end

  def error?
    begin
      yield if block_given?
      false
    rescue => e
      log_error e
      true
    end
  end

  def user_initialized?
    begin
      user
      true
    rescue Mongoid::Errors
      false
    end
  end

  def user
    current_user
  end
  # @return [String] The currently signed in user name. Defaults to +User.default_user_name+
  def user_name
    name = begin
      ActionController::HttpAuthentication::Basic::user_name_and_password(request).first
    rescue NoMethodError # Occurs when no authentication has been done
      User::DEFAULT_NAME
    end
  end
  def help_link
    link_with_glyph(
      '',
      'http://rubydoc.info/github/dmorrill10/acpc_poker_gui_client/master/file/Help.md',
      'question-sign',
      {
        class: ApplicationController.help_link_html_class,
        # `target: blank` option ensures that this link will be opened in a new tab
        target: 'blank',
        title: 'Help',
        data: { toggle: 'tooltip' }
      }
    )
  end
  def match
    if @match_view
      @match_view.match
    else
      @match ||= Match.new
    end
  end
end
