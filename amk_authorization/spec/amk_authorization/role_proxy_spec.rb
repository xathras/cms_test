describe AmkAuthorization::RoleProxy do
  it 'should add the role to the repository' do
    role_repo = AmkAuthorization::Repository.new
    permission_repo = AmkAuthorization::Repository.new

    proxy = AmkAuthorization::RoleProxy.new( :admin , 
      role_repo, permission_repo )

    expect( role_repo.count ).to eq( 1 )
  end

  it 'should add a single permission' do
    role_repo = AmkAuthorization::Repository.new
    permission_repo = AmkAuthorization::Repository.new

    proxy = AmkAuthorization::RoleProxy.new( :admin ,
      role_repo, permission_repo )

    proxy.permission( :view_events )
    expect( permission_repo.count ).to eq( 1 )
    expect( role_repo[:admin].permissions.count ).to eq( 1 )
  end

  it 'should add multiple permissions' do
    role_repo = AmkAuthorization::Repository.new
    permission_repo = AmkAuthorization::Repository.new

    proxy = AmkAuthorization::RoleProxy.new( :admin ,
      role_repo, permission_repo )

    proxy.permissions( :view_events, :create_events )
    expect( permission_repo.count ).to eq( 2 )
    expect( role_repo[:admin].permissions.count ).to eq( 2 )
  end

  it 'should not create a permission that already exists' do
    role_repo = AmkAuthorization::Repository.new
    permission_repo = AmkAuthorization::Repository.new
    permission_repo.add( AmkAuthorization::Permission.new( :view_events ) )

    proxy = AmkAuthorization::RoleProxy.new( :admin ,
      role_repo, permission_repo )

    proxy.permission( :view_events )
    expect( permission_repo.count ).to eq( 1 )
    expect( role_repo[:admin].permissions.count ).to eq( 1 )
  end
end