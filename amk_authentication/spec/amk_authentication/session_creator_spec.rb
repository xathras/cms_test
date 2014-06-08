require 'spec_helper'

describe AmkAuthentication::SessionCreator do
  it 'should provide a logged in session if the credentials are correct' do
    object = AmkAuthentication::SessionCreator.new( 
      double( 'Credential' , 
        hashed_password: valid_password_hash,
        password_salt: 'salt',
        id: 1 ),
      double( 'Context' , 
        request: double( 'Request' , remote_addr: '100' , user_agent: 'test' ))
      )

    expect( object.with( 'plaintext' ) ).to be_logged_in
  end

  it 'should provide an unlogged in session if the credentials are incorrect' do
    object = AmkAuthentication::SessionCreator.new( 
      double( 'Credential' , 
        hashed_password: invalid_password_hash,
        password_salt: 'salt',
        id: 1 ),
      double( 'Context' , 
        request: double( 'Request' , remote_addr: '100' , user_agent: 'test' ))
      )

    expect( object.with( 'plaintext' ) ).not_to be_logged_in
  end
end