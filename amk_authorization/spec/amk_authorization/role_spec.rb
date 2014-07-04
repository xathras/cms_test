describe AmkAuthorization::Role do
  it 'should have a name' do
    role = AmkAuthorization::Role.new( :admin )

    expect( role.name ).to eq( :admin )
  end

  it 'should stringify to the name' do
    role = AmkAuthorization::Role.new( :admin )

    expect( role.to_s ).to eq( 'admin' )
  end

  it 'should default to a blank list of permissions' do
    role = AmkAuthorization::Role.new( :admin )

    expect( role.permissions ).not_to be_nil
    expect( role.permissions ).to be_empty
  end
end
