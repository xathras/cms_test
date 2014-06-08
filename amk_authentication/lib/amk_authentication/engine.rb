module AmkAuthentication
  class Engine < ::Rails::Engine
    isolate_namespace AmkAuthentication

    class << self
      def configuration
        @configuration ||= AmkAuthentication::Configuration.new
      end

      def configure( &block )
        return unless block_given?

        yield self.configuration
      end
    end
  end
end
