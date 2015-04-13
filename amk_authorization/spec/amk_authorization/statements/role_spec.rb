require 'ostruct'

describe AmkAuthorization::Statements::Role do
  it 'should raise an exception if the role is nil' do
    expect { AmkAuthorization::Statements::Role.new( nil ) }.to raise_error( ArgumentError )
  end

  it 'should return a statement from #to' do
    statement = AmkAuthorization::Statements::Role.new( double( 'Role', name: 'admin' ) )

    expect( statement.to( :create_credentials ) ).not_to be_nil
  end

  it 'should support checking permission with a subject' do
    subject = OpenStruct.new
    stub = Class.new {
      attr_reader :name

      def initialize
        @name = 'admin'
      end

      def permitted_to?( permission_name )
        true
      end
    }.new
    statement = AmkAuthorization::Statements::Role.new( stub )
    statement.to( :create ).on( subject )

    expect( statement.permission_name ).to eq( :create_openstruct )
  end

  specify 'checking permission with a subject raises an error with bang' do
    subject = OpenStruct.new
    stub = Class.new {
      attr_reader :name

      def initialize
        @name = 'admin'
      end

      def permitted_to?( permission_name )
        false
      end
    }.new
    statement = AmkAuthorization::Statements::Role.new( stub )
    statement = statement.to( :create )

    expect { statement.on!( subject ) }.to raise_exception( AmkAuthorization::NotPermitted )
  end

  context 'role has permission' do
    it 'should resolve true' do
      role = double( 'Role' , name: 'admin' , permitted_to?: true )
      statement = AmkAuthorization::Statements::Role.new( role )
      statement = statement.to( 'create_credentials' )

      expect( statement.resolve ).to eq( true )
    end

    it 'should not throw an exception with bang' do
      role = double( 'Role' , name: 'admin' , permitted_to?: true )
      statement = AmkAuthorization::Statements::Role.new( role )
      statement = statement.to( 'create_credentials' )

      expect { statement.resolve! }.not_to raise_error
    end
  end

  context 'role does not have permission' do
    it 'should resolve false' do
      role = double( 'Role' , name: 'admin' , permitted_to?: false )
      statement = AmkAuthorization::Statements::Role.new( role )
      statement = statement.to( 'create_credentials' )

      expect( statement.resolve ).to eq( false )
    end

    it 'should throw an exception with bang' do
      role = double( 'Role' , name: 'admin' , permitted_to?: false )
      statement = AmkAuthorization::Statements::Role.new( role )
      statement = statement.to( 'create_credentials' )

      expect{ statement.resolve! }.to raise_exception( AmkAuthorization::NotPermitted )
    end
  end
end