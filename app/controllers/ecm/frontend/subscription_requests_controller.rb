class Ecm::Frontend::SubscriptionRequestsController < Ecm::FrontendController
  def new
    @subscription_request = ::SubscriptionRequest.new
    if Ecm::Subscriptions.premia_enabled?
      @subscription_premia = ::SubscriptionPremium.all
    end  

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @subscription_request = ::SubscriptionRequest.new(params[:subscription_request])
    if Ecm::Subscriptions.premia_enabled?
      @subscription_premia = ::SubscriptionPremium.all
    end  

    respond_to do |format|
      if @subscription_request.deliver
        format.html { redirect_to(new_subscription_request_path, :notice => 'Subscription request was successfully delivered.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
