Ecm::Subscriptions.config do |config|
  # The recipient for your subscription requests
  config.recipients = "change-me@example.com"
  
  # Enable or disable premia functionality
  # If enabled, don't forget to run
  # 
  # rails generate ecm:subscriptions:premia 
  #
  # and migrate.
  # 
  # config.enable_premia = true
  
  # Enable or disable options functionality
  # If enabled, don't forget to run
  # 
  # rails generate ecm:subscriptions:options 
  #
  # and migrate.
  # 
  # config.enable_options = true

  # Enable form fields to enter a gift address
  # config.enable_options = true  
  config.enable_gift_address = true
end
