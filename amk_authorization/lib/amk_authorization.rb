require "amk_authorization/version"

module AmkAuthorization
  load 'amk_authorization/repository.rb'
  load 'amk_authorization/role.rb'
  load 'amk_authorization/roles.rb'
  load 'amk_authorization/permission.rb'
  load 'amk_authorization/permissions.rb'
  load 'amk_authorization/configuration.rb'
  load 'amk_authorization/statements.rb'

  NotPermitted = Class.new( StandardError )

  def self.roles
    @roles ||= Roles.new
  end

  def self.permissions
    @permissions ||= Permissions.new
  end

  def self.build( &block )
    Configuration::Builder.new.instance_eval( &block )
  end

  def self.authorize( role_name: nil )
    Statements::Role.new( @roles[role_name.to_s] )
  end

  def self.permits?( subject )
    unless subject.respond_to?( :role )
      fail ArgumentError, 'Subject must define a role method'
    end
    authorize( role_name: subject.role )
  end
end
