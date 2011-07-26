

module Ecm
  module Subscriptions
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Generates the locale files"
             
        source_root File.expand_path('../../../../../../config/locales', __FILE__)
        
        def generate_locales
          copy_file "ecm_subscriptions_en.yml", "config/locales/ecm_subscriptions_en.yml"
          copy_file "ecm_subscriptions_de.yml", "config/locales/ecm_subscriptions_de.yml"
        end      
      end
    end
  end
end        
