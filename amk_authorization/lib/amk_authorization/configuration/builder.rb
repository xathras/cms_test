module AmkAuthorization
  module Configuration
    class Builder
      def role( role_name , &block )
        proxy = RoleProxy.new( role_name )
        proxy.instance_eval( &block ) if block_given?
      end
    end
  end
end