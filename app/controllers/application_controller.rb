class ApplicationController < ActionController::API
  def current_friend
    # @current_friend ||= Friend.get_by(session_token)
  end
end
