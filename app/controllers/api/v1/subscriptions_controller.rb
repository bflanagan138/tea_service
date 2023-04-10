class Api::V1::SubscriptionsController < ApplicationController
  def create
    require 'pry'; binding.pry
    subscription_1 = Subscription.new(subscription_params)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :tea_id)
  end
end
