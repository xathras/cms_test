require 'spec_helper'

feature 'authentication UI' do
  scenario 'logging in with valid credentials' do
    credentials = AmkAuthentication::Credential.new
    credentials.email = 'test@example.com'
    credentials.password_salt = 'easy_salt'
    credentials.hashed_password = AmkAuthentication::Password.hash( 'password', 'easy_salt', 1 )

    expect( credentials.save ).to eq( true )

    visit '/login'

    fill_in 'session_email' , with: 'test@example.com'
    fill_in 'session_password' , with: 'password'
    click_button 'Submit'

    expect( AmkAuthentication::Session.count ).to eq( 1 )
    expect( current_path ).to eq( '/' )
  end
end