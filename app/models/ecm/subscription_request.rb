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
  attribute :subscription_premium_name
  validates :subscription_premium_name, :inclusion => ::SubscriptionPremium.all.collect(&:name), :if => :validate_premia?  

  def subscription_premium_id=(id)
    self.subscription_premium_name = ::SubscriptionPremium.find(id).name rescue nil
  end
  
  def validate_premia?
    ::Ecm::Subscriptions.premia_enabled? && SubscriptionPremium.all.count > 0
  end  
  
  
  attribute :subscription_option_id
  attribute :subscription_option_name
  validates :subscription_option_name, :inclusion => ::SubscriptionOption.all.collect(&:name), :if => :validate_options?  

  def subscription_option_id=(id)
    self.subscription_option_name = ::SubscriptionOption.find(id).name rescue nil
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
