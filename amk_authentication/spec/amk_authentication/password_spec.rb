require 'spec_helper'

describe AmkAuthentication::Password do
  it 'should encrypt/hash the password with a salt' do
    object = AmkAuthentication::Password.new( 'password' , 'salt' , 1 )
    expect( object.hash ).not_to eq( 'password' )
  end
end