module AmkAuthorization
  module Configuration
    class RoleProxy
      def initialize( role_name , 
                      role_store = AmkAuthorization.roles,
                      permission_store = AmkAuthorization.permissions )
        @role = AmkAuthorization::Role.new( role_name )
        @role_store = role_store
        @permission_store = permission_store
        
        @role_store.add( @role )
      end

      def permission( permission_name )
        permission_object = fetch_or_create_permission( permission_name )
        @role.permissions.push( permission_object )
      end

      def permissions( *args )
        @role.permissions += args.map { |name| fetch_or_create_permission( name ) }
      end

    private
      def fetch_or_create_permission( name )
        @permission_store[name] ||
        @permission_store.add( AmkAuthorization::Permission.new( name ) )
      end
    end
  end
end