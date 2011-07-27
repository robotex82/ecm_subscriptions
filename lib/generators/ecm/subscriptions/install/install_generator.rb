require 'rails/generators/migration'

module Ecm
  module Subscriptions
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Generates the initializer, locales, mailer views and premia migration and settings"
             
        source_root File.expand_path('../templates', __FILE__)
        
        def generate_initializer
          copy_file "initializers_ecm_subscriptions.rb", "config/initializers/ecm_subscriptions.rb"
        end     
        
        def generate_locales
          generate('ecm:subscriptions:locales')
        end
        
        def generate_mailer_views
          generate('ecm:subscriptions:mailer_views')
        end
        
        def generate_premia
          generate('ecm:subscriptions:premia')
        end 
      end
    end
  end
end        
