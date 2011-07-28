class SubscriptionOption < Ecm::SubscriptionOption
  rails_admin do
    list do
      field :months
      field :description
      field :formatted_price
      field :currency    
      field :created_at
      field :updated_at
    end
    
    edit do
      field :months
      field :description
      field :price   
      field :created_at
      field :updated_at
    end
  end
end
