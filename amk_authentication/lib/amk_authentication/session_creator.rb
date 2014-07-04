module AmkAuthentication
  class SessionCreator
    attr_reader :session, :request
    def initialize( credentials , request_params )
      @hashed_password = credentials.hashed_password
      @salt = credentials.password_salt
      @credentials_id = credentials.id
      @request = request_params
    end

    def with( password )
      @session = if authentic?( password )
        Session.create( credentials_id: @credentials_id ,
          ip_address: request.remote_addr,
          uuid: SecureRandom.uuid,
          user_agent: request.user_agent )
      else
        NullSession.new
      end
      self
    end

    def succeeded?
      @session.logged_in?
    end

  private
    def authentic?( password )
      Authenticator.new( @hashed_password , password , @salt ).authentic?
    end

  end
end