module AmkAuthentication
  class NullSession
    def logged_in?
      false
    end
  end
end