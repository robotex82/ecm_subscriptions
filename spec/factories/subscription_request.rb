Factory.define(:subscription_request) do |subscription_request| 
  subscription_request.firstname 'John'
  subscription_request.lastname  'Doe'
  subscription_request.zip_code  '60313'
  subscription_request.city      'Frankfurt am Main'
  subscription_request.email     'john.doe@example.com'
  subscription_request.phone     '+49 69 123456789'
  
  subscription_request.account_number '123456789'
  subscription_request.bank_code      '10020030'
  subscription_request.bank           'Testbank Frankfurt' 
  subscription_request.account_holder 'John Doe'
  subscription_request.payment_method 'direct_debit'
  
  #subscription_request.subscription_premium_name 'USB Stick'
  #subscription_request.subscription_option_name '24 Monate'
  subscription_request.association :subscription_premium
  subscription_request.association :subscription_option
end
