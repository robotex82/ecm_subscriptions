require 'spec_helper'

module Ecm
  module Frontend
    describe SubscriptionRequestsController do
      render_views
      
      def valid_attributes
        Factory.attributes_for(:subscription_request)
      end
    
      describe "GET 'new'" do
        it "should render the correct template" do
          get :new
          response.should render_template('new')
        end
        
        it "should assign a subscription request to @subscription_request" do
          get :new
          assigns(:subscription_request).should be_a(SubscriptionRequest)
        end
      end # describe "GET 'new'"

      describe "POST 'create'" do
        before(:each) do
          ActionMailer::Base.deliveries = []
        end
        
        describe "with valid params" do
          it "should deliver the subscription request" do
            expect {
              post :create, :subscription_request => valid_attributes
            }.to change(ActionMailer::Base.deliveries, :size).by(2)  
          end
          
          it "assigns a newly created subscription request as @subscription_request" do
            post :create, :subscription_request => valid_attributes
            assigns(:subscription_request).should be_a(SubscriptionRequest)
          end

          it "redirects to the new action" do
            post :create, :subscription_request => valid_attributes
            response.should redirect_to(new_subscription_request_path)
          end
        end # describe "with valid params"
        
        describe "with invalid params" do
          it "assigns a newly created but undelivered subscription request as @subscription_request" do
            # Trigger the behavior that occurs when invalid params are submitted
            post :create, :subscription_request => {}
            assigns(:subscription_request).should be_a_new(SubscriptionRequest)
          end

          it "re-renders the 'new' template" do
            # Trigger the behavior that occurs when invalid params are submitted
            post :create, :subscription_request => {}
            response.should render_template("new")
          end
        end # describe "with invalid params"

      end # describe "POST 'create'"    
    end
  end
end    
