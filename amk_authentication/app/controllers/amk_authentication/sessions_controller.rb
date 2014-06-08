module AmkAuthentication
  class SessionsController < AmkAuthentication::ApplicationController
    def new
      if current_session.logged_in?
        redirect_to back_or_default
      end
      session.delete( :session_id )
      @session_form = SessionForm.new
    end

    def create
      @session_form = SessionForm.new session_params
      if user = user_repository.find_by( email: session_params[:email] ) &&
        @current_session = login( user ).with( session_params[:password] ) &&
        current_session.logged_in?
        session[:session_id] = current_session.id
      else
        render action: 'new'
      end
    end

    def destroy
      logout( current_session )
      redirect_to login_path
    end

  private
    def user_repository
      AmkAuthentication::UserAccount
    end

    def login( user )
      SessionCreator.new( user , self )
    end

    def logout
      current_session.update_attribute( :deleted_at , Time.now.utc )
      session.delete( :session_id )
    end
  end
end