describe AmkAuthorization::Statments::Role do
  it 'should raise an exception if the role is nil' do
    expect { AmkAuthorization::Statments::Role.new( nil ) }.to raise_error( ArgumentError )
  end

  it 'should return a statement from #to' do
    statement = AmkAuthorization::Statments::Role.new( double( 'Role', name: 'admin' ) )

    expect( statement.to( :create_credentials ) ).not_to be_nil
  end

  context 'role has permission' do
    it 'should resolve true' do
      role = double( 'Role' , name: 'admin' , permitted_to?: true )
      statement = AmkAuthorization::Statments::Role.new( role )
      statement = statement.to( 'create_credentials' )

      expect( statement.resolve ).to eq( true )
    end
  end

  context 'role does not have permission' do
    it 'should resolve false' do
      role = double( 'Role' , name: 'admin' , permitted_to?: false )
      statement = AmkAuthorization::Statments::Role.new( role )
      statement = statement.to( 'create_credentials' )

      expect( statement.resolve ).to eq( false )
    end
  end
end