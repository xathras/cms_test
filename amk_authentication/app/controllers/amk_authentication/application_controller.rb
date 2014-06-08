module AmkAuthentication
  class ApplicationController < ActionController::Base
  protected

    helper_method :current_session
    def current_session
      @current_session ||= Session.find_by( uuid: session[:session_id] ) || NullSession.new
    end

    helper_method: current_user
    def current_user
      @current_user ||= UserAccount.find_by( id: @current_session.user_id )
    end

    def store_location
      session[:return_to] = request.url if request.get?
    end

    def back_or_default( destination = nil )
      session.delete( :return_to ) || destination || default_path
    end

    def default_path
      send_public( AmkAuthentication::Engine.configuration.post_login_path )
    end
  end
end
