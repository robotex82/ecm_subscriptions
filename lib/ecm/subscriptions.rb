module Ecm
  module Subscriptions
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::SubscriptionHelper)
      end  
    end
  end  
end
