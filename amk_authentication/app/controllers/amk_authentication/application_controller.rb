module AmkAuthentication
  class ApplicationController < ActionController::Base
  protected

    helper_method :current_session
    def current_session
      @current_session ||= session_repository.find_by( uuid: session[:session_id] ) || NullSession.new
    end

    helper_method :current_credentials
    def current_credentials
      @current_credentials ||= credentials_repository.find_by( id: current_session.credentials_id )
    end

    def store_location
      session[:return_to] = request.url if request.get?
    end

    def back_or_default( destination = nil )
      session.delete( :return_to ) || destination || default_path
    end

    def default_path
      post_login_path = AmkAuthentication::Engine.
        configuration.
        post_login_path.
        to_s
      unless post_login_path =~ /\//
        post_login_path.split('.').reduce(self) { |obj, chain_link|
            obj.send( chain_link )
          }
      else
        post_login_path
      end
    end

    def credentials_repository
      Credentials
    end

    def session_repository
      Session
    end
  end
end
