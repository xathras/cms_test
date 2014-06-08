module AmkAuthentication
  class SessionCreator
    def initialize( credentials , context )
      @hashed_password = credentials.hashed_password
      @salt = credentials.password_salt
      @credentials_id = credentials.id
      @context = context
    end

    def with( password )
      if authentic?( password )
        Session.create( credentials_id: @credentials_id ,
          ip_address: request.remote_addr,
          uuid: SecureRandom.uuid,
          user_agent: request.user_agent )
      else
        NullSession.new
      end
    end

  private
    def authentic?( password )
      Authenticator.new( @hashed_password , password , @salt ).authentic?
    end

    def request
      @request ||= @context.request
    end
  end
end