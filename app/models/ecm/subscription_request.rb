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
      :subject => "Subscription Request"
    }
  end
  
  def fullname
    "#{firstname} #{lastname}"
  end
  
  def deliver!
    Notifier.request(self).deliver
    Notifier.confirmation(self).deliver
  end  
    
  class Notifier < ActionMailer::Base
    self.mailer_name = "mail_form"
    append_view_path File.expand_path('../views', __FILE__)

    def request(resource)
      if resource.request.nil? && resource.class.mail_appendable.any?
        raise ScriptError, "You set :append values but forgot to give me the request object"
      end

      @resource = @form = resource

      resource.class.mail_attachments.each do |attribute|
        value = resource.send(attribute)
        next unless value.respond_to?(:read)
        attachments[value.original_filename] = value.read
      end

      headers = resource.headers
      headers[:to] = %("#{resource.fullname}" <#{resource.email}>)
      headers[:from] = Ecm::Subscriptions.config.recipients
      headers[:subject] ||= resource.class.model_name.human
      mail(headers)
    end

    def confirmation(resource)
      if resource.request.nil? && resource.class.mail_appendable.any?
        raise ScriptError, "You set :append values but forgot to give me the request object"
      end

      @resource = @form = resource

      resource.class.mail_attachments.each do |attribute|
        value = resource.send(attribute)
        next unless value.respond_to?(:read)
        attachments[value.original_filename] = value.read
      end

      headers = resource.headers
      headers[:to] = Ecm::Subscriptions.config.recipients
      headers[:from] = %("#{resource.fullname}" <#{resource.email}>)
      headers[:subject] ||= resource.class.model_name.human
      mail(headers)
    end
  end
end
