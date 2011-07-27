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
  config.enable_premia = true
end
