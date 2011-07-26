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
    
    def self.premia_enabled?
      return false unless self.config.enable_premia
      unless SubscriptionPremium.table_exists?
        Rails.logger.warn("Ecm::Subscriptions: Enabled Subscription Premia, but missing table for Subscription Premia!")
        return false
      end  
      return true
    end  
  end  
end
