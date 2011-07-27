module Ecm
  module Subscriptions
    module Generators
      class MailerViewsGenerator < Rails::Generators::Base
        desc "Generates the mailer views"
             
        source_root File.expand_path('../../../../../../app/views', __FILE__)
        
        def generate_locales
          copy_file "ecm/subscription_requests/notifier/confirmation.de.markerb", "app/views/ecm/subscription_requests/notifier/confirmation.de.markerb"
          copy_file "ecm/subscription_requests/notifier/confirmation.en.markerb", "app/views/ecm/subscription_requests/notifier/confirmation.en.markerb"
          copy_file "ecm/subscription_requests/notifier/subscriber_confirmation.en.markerb", "app/views/ecm/subscription_requests/notifier/subscriber_confirmation.en.markerb"
          copy_file "ecm/subscription_requests/notifier/subscriber_confirmation.de.markerb", "app/views/ecm/subscription_requests/notifier/subscriber_confirmation.de.markerb"
        end      
      end
    end
  end
end        
