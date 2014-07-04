module AmkAuthorization
  class Permission
    attr_accessor :name
    def initialize( _name )
      @name = _name
    end

    def to_s
      @name.to_s
    end
  end
end
