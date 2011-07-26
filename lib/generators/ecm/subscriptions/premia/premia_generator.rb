require 'rails/generators/migration'

module Ecm
  module Subscriptions
    module Generators
      class PremiaGenerator < Rails::Generators::Base
        include Rails::Generators::Migration
        
        desc "Installs premia functionality."
             
        source_root File.expand_path('../templates', __FILE__)
        
        def generate_model
          template("subscription_premium.rb", "app/models/subscription_premium.rb")
        end   
        
        def self.next_migration_number(path)
          unless @prev_migration_nr
            @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
          else
            @prev_migration_nr += 1
          end
          @prev_migration_nr.to_s
        end
        
        def generate_migration
          migration_template "create_subscription_premia.rb", "db/migrate/create_subscription_premia.rb"
        end    
                
      end
    end
  end
end        
