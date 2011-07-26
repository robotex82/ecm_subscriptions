

module Ecm
  module Subscriptions
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Generates the locale files"
             
        source_root File.expand_path('../../../../../../config/locales', __FILE__)
        
        def generate_locales
          copy_file "ecm.subscriptions.en.yml", "config/locales/ecm.subscriptions.en.yml"
          copy_file "ecm.subscriptions.de.yml", "config/locales/ecm.subscriptions.de.yml"
        end      
      end
    end
  end
end        
