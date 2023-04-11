class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = Subscription.where(customer_id: params[:customer_id])
    if !customer.subscriptions.empty? 
      render json: CustomerSerializer.new(customer)
    else
      render json: { error: "No Subscriptions Found" }
    end
  end
  
  def create
    subscription = Subscription.new(subscription_params)
    subscription.status = "active"
    if subscription.save
      render json: SubscriptionSerializer.new_sub(subscription), status: 201
    else
      render json: ErrorSerializer.subscription_not_created, status: 400
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :status, :tea_id, :customer_id)
  end
end
