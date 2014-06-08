module AmkAuthentication
  class Authenticator
    def self.authentic?( encrypted_password , plaintext_password , 
      salt )
      new( encrypted_password , plaintext_password , salt ).authentic?
    end

    def initialize( hashed , plaintext , salt )
      @hashed = hashed
      @plaintext = plaintext
      @salt = salt
    end

    def authentic?
      BCrypt::Password.new( @hashed ) == "#{@plaintext}#{@salt}"
    end
  end
end