require 'spec_helper'

describe SubscriptionRequest do
  before(:each) do
    @subscription_request = SubscriptionRequest.new(Factory.attributes_for(:subscription_request))
  end
   
  describe "with disabled options" do
    before(:each) do
      Ecm::Subscriptions.config.enable_options = false
    end  
    
    describe "with enabled premia" do
      before(:each) do
        Ecm::Subscriptions.config.enable_premia = true
      end
      
      describe "without premia in the database" do
        before(:each) do
          SubscriptionPremium.all.map &:destroy
        end
        
        it "should be valid without a premium" do
          @subscription_request.subscription_premium_id = nil
          @subscription_request.should be_valid
        end
      end # describe "without premia in the database"
      
      describe "with premia in the database" do
        before(:each) do
          SubscriptionPremium.all.map &:destroy
          @subscription_request.subscription_premium = Factory(:subscription_premium)
        end
        
        it "should be valid with a premium" do
        @subscription_request.valid?
        puts @subscription_request.errors.inspect
          @subscription_request.should be_valid
          
        end
      end # describe "with premia in the database"
    end # describe "with enabled premia"    
  end # describe "with disabled options"
  
end # describe SubscriptionRequest 
