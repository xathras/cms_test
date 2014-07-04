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
      (credential = credential_repository.find_by( email: session_params[:email] ))
      if credential && 
        login( credential ).with( session_params[:password] ).succeeded?
        @current_session = @login.session
        session[:session_id] = current_session.id
        respond_to do |wants|
          wants.html { redirect_to back_or_default }
          wants.json do
            render json: { session_id: current_session.id }, status: :ok
          end
        end
      else
        respond_to do |wants|
          wants.html { render action: 'new' }
          wants.json { status :not_authorized }
        end
      end
    end

    def destroy
      logout( current_session )
      redirect_to login_path
    end

  private
    def credential_repository
      AmkAuthentication::Credential
    end

    def login( credential )
      @login ||= SessionCreator.new( credential , self.request )
    end

    def logout
      current_session.update_attribute( :deleted_at , Time.now.utc )
      session.delete( :session_id )
    end

    def session_params
      @session_params = params.require( :session ).permit( :email, :password )
    end
  end
end