class CustomerSerializer
  def self.new(customer)
    {
      "data": {
        "id": customer.id,
        "attributes": {
          "first_name": customer.first_name,
          "last_name": customer.last_name,
          "email": customer.email,
          "address": customer.address,
          "subscriptions": customer.subscriptions.map do |subscription|
            {
              "id": subscription.id,
              "title": subscription.title,
              "price": subscription.price,
              "status": subscription.status,
              "frequency": subscription.frequency,
              "tea": {
                "title": subscription.tea.title,
                "description": subscription.tea.description,
                "temperature": subscription.tea.temperature,
                "brew_time": subscription.tea.brew_time
              }
            }
          end
        }
       
        }
      }
  end

  def self.empty(customer)
    {
      "data": {
        "id": customer.id,
        "attributes": {
          "first_name": customer.first_name,
          "last_name": customer.last_name,
          "email": customer.email,
          "address": customer.address,
          "subscriptions": "No Subscriptions Found"
        }
       
      }
    }
  end
  
end