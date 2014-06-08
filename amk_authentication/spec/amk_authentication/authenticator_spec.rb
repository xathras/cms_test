require 'spec_helper'

describe AmkAuthentication::Authenticator do
  it 'should indicate if the encrypted and plaintext passwords do not match' do
    expect( AmkAuthentication::Authenticator.new( 
      '$2a$04$HuFzBiqaVEZKRNnVSqIOf.4oRqMEBMlL/SPtF/6xOwepxdo3WGyGw', 'plaintext' , 'salt' )
      ).not_to be_authentic
  end

  it 'shoudl indicate if the encrypted and plaintext passwords do match' do
    expect( AmkAuthentication::Authenticator.new( 
      '$2a$04$HuFzBiqaVEZKRNnVSqIOf.4oRqMEBMlL/SPtF/6xOwepxdo3WGyGW', 'plaintext' , 'salt' )
      ).to be_authentic
  end
end