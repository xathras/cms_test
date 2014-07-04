require "amk_authorization/version"

module AmkAuthorization
  load 'amk_authorization/repository.rb'
  load 'amk_authorization/role.rb'
  load 'amk_authorization/roles.rb'
  load 'amk_authorization/permission.rb'
  load 'amk_authorization/permissions.rb'
  load 'amk_authorization/builder.rb'
  load 'amk_authorization/role_proxy.rb'

  def self.roles
    @roles ||= Roles.new
  end

  def self.permissions
    @permissions ||= Permissions.new
  end

  def self.build( &block )
    Builder.new.instance_eval( &block )
  end
end
