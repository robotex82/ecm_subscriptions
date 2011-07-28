class Ecm::SubscriptionPremium < ActiveRecord::Base
  self.abstract_class = true
  
  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true

  composed_of :price,
    :class_name => "Money",
    :mapping => [%w(price_cents cents), %w(currency currency_as_string)],
    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
  
  def label
    I18n.translate :label, :name => name, :formatted_price => formatted_price, :scope => [:activerecord, :attributes, :subscription_premium]
  end 
  
  def formatted_price
    "#{price.to_s} #{price.currency.to_s}"
  end  
  
  def currency
    price.currency.to_s
  end    
end
