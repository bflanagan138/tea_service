class Api::V1::SubscriptionsController < ApplicationController
  def index

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
