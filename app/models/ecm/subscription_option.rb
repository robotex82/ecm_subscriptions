class Ecm::SubscriptionOption < ActiveRecord::Base
  self.abstract_class = true
  
  validates :name, :presence => true, :uniqueness => true
  # validates :description, :presence => true

  def label
    "#{name} - #{description}"
  end

end
