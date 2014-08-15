module AmkAuthorization
  module Statments
    class Role
      attr_accessor :role
      def initialize( _role )
        raise ArgumentError, 'Role cannot be nil' if _role.nil?
        @role = _role
        @permission_name = nil
      end

      def to( permission_name )
        raise ArgumentError, 'You must supply a permission name' if permission_name.nil?
        @permission_name = permission_name
        self
      end

      def resolve
        @role.permitted_to?( @permission_name )
      end
    end
  end
end