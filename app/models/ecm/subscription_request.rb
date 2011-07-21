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

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Subscription Request",
      :to => to,
      :from => %("#{fullname}" <#{email}>)
    }
  end
  
  def fullname
    "#{firstname} #{lastname}"
  end
  
  def to
    raise "Call to abstract method: to. You have tu subclass Ecm::SubscriptionRequest and define the method 'to'"
  end    
end
