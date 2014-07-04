describe AmkAuthorization::Permission do
  it 'should have a name' do
    role = AmkAuthorization::Permission.new( :admin )

    expect( role.name ).to eq( :admin )
  end

  it 'should stringify to the name' do
    role = AmkAuthorization::Permission.new( :admin )

    expect( role.to_s ).to eq( 'admin' )
  end
end