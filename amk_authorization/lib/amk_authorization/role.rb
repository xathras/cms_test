module AmkAuthorization
  class Role
    attr_accessor :name , :permissions
    def initialize( _name )
      @name = _name
      @permissions = []
    end

    def to_s
      @name.to_s
    end
  end
end
