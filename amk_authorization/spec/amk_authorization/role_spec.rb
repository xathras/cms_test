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

  it 'should be permitted to one of its permissions' do
    role = AmkAuthorization::Role.new( :admin )
    role.permissions.push( double( 'Permission' , name: :view_events ) )

    expect( role ).to be_permitted_to( :view_events )
  end

  it 'should not be permitted to do something thats not in the permission list' do
    role = AmkAuthorization::Role.new( :admin )
    role.permissions.push( double( 'Permission' , name: :view_events ) )

    expect( role ).not_to be_permitted_to( :create_events )
  end
end
