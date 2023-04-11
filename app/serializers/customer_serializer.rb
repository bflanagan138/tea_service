class CustomerSerializer
  def self.new(customer)
    {
      "data": {
        id: customer.id,
        attributes: {
          "first_name": customer.first_name,
          "last_name": customer.last_name,
          "email": customer.email,
          "address": customer.address,
          "subscriptions": customer.subscriptions.map do |subscription|
            {
              "title": subscription.title,
              "price": subscription.price,
              "status": subscription.status,
              "frequency": subscription.frequency
            }
          end
        }
       
        }
      }
  end
end