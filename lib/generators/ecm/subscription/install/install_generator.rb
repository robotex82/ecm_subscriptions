require 'rails/generators/migration'

module Ecm
  module Subscription
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Generates the initializer"
             
        source_root File.expand_path('../templates', __FILE__)
        
        def generate_initializer
          copy_file "initializers_ecm_subscriptions.rb", "config/initializers/ecm_subscriptions.rb"
        end      
      end
    end
  end
end        
