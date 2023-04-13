class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = Subscription.where(customer_id: params[:customer_id])
    if !customer.subscriptions.empty? 
      render json: CustomerSerializer.new(customer)
    else
      render json: CustomerSerializer.empty(customer)
    end
  end
  
  def create
    # subscription = Subscription.create!(subscription_params)
    subscription_id = Subscription.last[:id] + 1
    subscription = Subscription.new(subscription_params)
    
    subscription.status = "active"
    subscription.save

    if subscription.save
    render json: SubscriptionSerializer.new_sub(subscription), status: 201
    else
      render json: ErrorSerializer.subscription_not_created, status: 400
    end
  end

  def update 
    sub = Subscription.find_by(id: params[:id])
    if sub.status == "active"
      sub.status = "cancelled"
      render json: SubscriptionSerializer.new_sub(sub), status: 201
    else
      render json: ErrorSerializer.cancelled_already
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :frequency, :tea_id, :customer_id)
  end
end
