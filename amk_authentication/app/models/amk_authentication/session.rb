module AmkAuthentication
  class Session < ActiveRecord::Base
    def logged_in?
      deleted_at.nil? && persisted?
    end
  end
end
