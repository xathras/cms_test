# AmkAuthorization

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'amk_authorization'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install amk_authorization

## Usage

    AmkAuthorization.configure do
      role :admin do
        right :create_user
      end
    end

    permit( subject ).to( verb ).on( object )

    permit( subject ).to( verb ).on!( object )
    # raises NotPermitted exception

    permit( user ).to( :create ).on( new_user )

    class User
      def permit?( subject, verb )
      end
    end

    permit( user ).to( :view ).or( :create ).on( )

## Contributing

1. Fork it ( https://github.com/[my-github-username]/amk_authorization/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
