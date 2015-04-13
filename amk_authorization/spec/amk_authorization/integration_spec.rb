require 'spec_helper'

RSpec.describe 'integration of all the parts' do
  before( :each ) do
    User = Class.new
  end

  after( :each ) do
    Object.send( :remove_const, :User )
  end

  it 'can handle permissions on objects that do not know about authorization' do
    AmkAuthorization.build do
      role :admin do
        permission :create_user
      end
    end

    subject = double( role: 'admin' )
    object = User.new

    expect( AmkAuthorization.permits?( subject ).to( :create ).on( object ) ).to eq( true )
  end
end