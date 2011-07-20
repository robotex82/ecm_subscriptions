 Rails.application.routes.draw do
  resources :subscription_requests, :controller => 'ecm/frontend/subscription_requests', :only => [:new, :create]
end
