class SubscriptionSerializer
  def self.new_sub(subscription)
    {
      "data": {
        "id": subscription.id,
        "title": subscription.title,
        "price": subscription.price,
        "frequency": subscription.frequency,
        "status": subscription.status,
        "tea": {
          "title": subscription.tea.title,
          "description": subscription.tea.description,
          "temperature": subscription.tea.temperature,
          "brew_time": subscription.tea.brew_time
        }
      }
    }

  end
end