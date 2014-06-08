module AmkAuthentication
  class SessionCreator
    def initialize( user , context )
      @hashed_password = user.hashed_password
      @salt = user.password_salt
      @user_id = user.id
      @context = context
    end

    def with( password )
      if authentic?( password )
        Session.create( user_id: @user_id ,
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