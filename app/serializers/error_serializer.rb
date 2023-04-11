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
end