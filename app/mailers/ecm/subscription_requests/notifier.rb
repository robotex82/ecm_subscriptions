module Ecm
  module SubscriptionRequests
    class Notifier < ActionMailer::Base
      # self.mailer_name = "mail_form"
      append_view_path File.expand_path('../../../views', __FILE__)

      def subscriber_confirmation(resource)
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
#        mail(headers) do |format|
#          format.html { render 'another_template' }
#          format.text { render 'another_template' }
#        end
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
#        mail(headers) do |format|
#          format.html { render 'another_template' }
#          format.text { render 'another_template' }
#        end
      end
    end
  end    
end
