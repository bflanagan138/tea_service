class ErrorSerializer
  def self.subscription_not_created
    {
      errors: 
      {
        status: 400,
        title: "Subscription not saved"
      }
    }
  end
  
  def self.cancelled_already
    {
      errors: 
      {
        status: 422,
        title: "No Active Subscription Exists"
      }
    }
  end
end