module Ecm
  module Subscriptions
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::SubscriptionHelper)
      end  
    end
    
    def self.config(&block)
      # @@config ||= ::Ecm::Subscriptions::Engine::Configuration.new(find_root_with_flag('lib'))
      @@config ||= Engine.config
      yield @@config if block
      return @@config
    end
    
  end  
end
