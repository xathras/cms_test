module AmkAuthentication
  class Password
    def self.hash( plaintext , salt = 'salt' , cost = 10 )
      new( plaintext , salt , cost ).encrypt
    end

    def initialize( plaintext , salt , cost )
      @plaintext , @salt , @cost = plaintext , salt , cost
    end

    def hash
      BCrypt::Password.create( "#{@plaintext}#{@salt}" , cost: @cost )
    end
  end
end