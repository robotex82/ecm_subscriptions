class Ecm::SubscriptionRequest < MailForm::Base
  PAYMENT_METHODS = %w(bank_transfer direct_debit)
  validates_inclusion_of :payment_method, :in => PAYMENT_METHODS
  
  attribute :firstname, :validate => true
  attribute :lastname,  :validate => true
  attribute :zip_code,  :validate => true
  attribute :city,      :validate => true
  attribute :email,     :validate => /[^@]+@[^\.]+\.[\w\.\-]+/
  attribute :phone,     :validate => true
  
  attribute :account_number, :validate => true  
  attribute :bank_code,      :validate => true
  attribute :bank,           :validate => true
  attribute :account_holder, :validate => true
  attribute :payment_method # , :validate => true
  
  attribute :nickname,  :captcha  => true


  attribute :subscription_premium_id
  attribute :subscription_premium_label
  # validates :subscription_premium, :inclusion => ::SubscriptionPremium.all, :if => :validate_premia?  
  validates :subscription_premium_id, :presence => true, :if => :validate_premia?  
  
  def subscription_premium=(subscription_premium)
    @subscription_premium = subscription_premium
  end  
  
  def subscription_premium
    @subscription_premium
  end 
  
  def subscription_premium_id=(id)
    @subscription_premium = ::SubscriptionPremium.find(id) rescue nil
  end     
  
  def subscription_premium_id
    @subscription_premium.id rescue nil
  end 
  
  def subscription_premium_label
    @subscription_premium.label rescue nil
  end 
  
  def validate_premia?
    ::Ecm::Subscriptions.premia_enabled? && SubscriptionPremium.all.count > 0
  end  
  
  
  attribute :subscription_option_id
  attribute :subscription_option_label
  # validates :subscription_option, :inclusion => ::SubscriptionOption.all, :if => :validate_options?
  validates :subscription_option_id, :presence => true, :if => :validate_options?    
  
  def subscription_option=(subscription_option)
    @subscription_option = subscription_option
  end  
  
  def subscription_option
    @subscription_option
  end 
  
  def subscription_option_id=(id)
    @subscription_option = ::SubscriptionOption.find(id) rescue nil
  end     
  
  def subscription_option_id
    @subscription_option.id rescue nil
  end 
  
  def subscription_option_label
    @subscription_option.label rescue nil
  end    
  
  def validate_options?
    ::Ecm::Subscriptions.options_enabled? && SubscriptionOption.all.count > 0
  end  
  

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Subscription Request"
    }
  end
  
  def fullname
    "#{firstname} #{lastname}"
  end
  
  def deliver!
    ::Ecm::SubscriptionRequests::Notifier.subscriber_confirmation(self).deliver
    ::Ecm::SubscriptionRequests::Notifier.confirmation(self).deliver
  end  

end
