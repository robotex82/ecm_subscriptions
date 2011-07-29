module Ecm
  module Subscriptions
    module Generators
      class ViewsGenerator < Rails::Generators::Base
        desc "Generates the subscription request views"
             
        source_root File.expand_path('../../../../../../app/views', __FILE__)
        
        def generate_views
          copy_file "ecm/frontend/subscription_requests/_actions.html.erb", "app/views/ecm/frontend/subscription_requests/_actions.html.erb"
          copy_file "ecm/frontend/subscription_requests/_errors.html.erb", "app/views/ecm/frontend/subscription_requests/_errors.html.erb"
          
          copy_file "ecm/frontend/subscription_requests/_form.html.erb", "app/views/ecm/frontend/subscription_requests/_form.html.erb"
          copy_file "ecm/frontend/subscription_requests/new.html.erb", "app/views/ecm/frontend/subscription_requests/new.html.erb"
          
          copy_file "ecm/frontend/subscription_requests/_payment_information.html.erb", "app/views/ecm/frontend/subscription_requests/_payment_information.html.erb"
          copy_file "ecm/frontend/subscription_requests/_payment_method.html.erb", "app/views/ecm/frontend/subscription_requests/_payment_method.html.erb"
          
          copy_file "ecm/frontend/subscription_requests/_spam_honeypot.html.erb", "app/views/ecm/frontend/subscription_requests/_spam_honeypot.html.erb"
          copy_file "ecm/frontend/subscription_requests/_subscriber_address.html.erb", "app/views/ecm/frontend/subscription_requests/_subscriber_address.html.erb"
          
          copy_file "ecm/frontend/subscription_requests/_subscription_options.html.erb", "app/views/ecm/frontend/subscription_requests/_subscription_options.html.erb"
          copy_file "ecm/frontend/subscription_requests/_subscription_premia.html.erb", "app/views/ecm/frontend/subscription_requests/_subscription_premia.html.erb"                    
        end      
      end
    end
  end
end        
