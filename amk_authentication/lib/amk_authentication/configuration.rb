module AmkAuthentication
  class Configuration
    attr_accessor :post_login_path

    def post_login_path
      @post_login_path ||= '/'
    end
  end
end