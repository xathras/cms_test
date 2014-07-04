module AmkAuthorization
  class Repository
    def initialize
      @dictionary = {}
    end

    def add( object )
      @dictionary[object.name.to_s] = object
    end

    def delete( object )
      if object.respond_to?( :name )
        @dictionary.delete( object.name.to_s )
      else
        @dictionary.delete( object.to_s )
      end
    end

    def []( object )
      if object.respond_to?( :name )
        @dictionary[object.name.to_s]
      else
        @dictionary[object.to_s]
      end
    end

    def count
      @dictionary.count
    end
  end
end