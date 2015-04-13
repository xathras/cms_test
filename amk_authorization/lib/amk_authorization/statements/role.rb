module AmkAuthorization
  module Statements
    class Role
      attr_accessor :role, :subject, :permission_name
      def initialize( _role )
        raise ArgumentError, 'Role cannot be nil' if _role.nil?
        @role = _role
        @permission_name = nil
        @subject = nil
      end

      def to( permission_name )
        raise ArgumentError, 'You must supply a permission name' if permission_name.nil?
        @permission_name = permission_name
        self
      end

      def on( subject )
        @subject = subject
        @permission_name = "#{@permission_name}_#{@subject.class.to_s.downcase}".to_sym
        resolve
      end

      def on!( subject )
        raise NotPermitted unless on( subject )
        true
      end

      def resolve
        return resolve_on_subject if @subject.respond_to?( :permit? )
        @role.permitted_to?( @permission_name )
      end

      def resolve!
        raise NotPermitted unless resolve
        true
      end

    private
      def resolve_on_subject
        @subject.permit?( @subject, @permission_name )
      end
    end
  end
end