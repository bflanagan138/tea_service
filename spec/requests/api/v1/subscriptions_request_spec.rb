require 'rails_helper'

RSpec.describe "subscriptions" do
  it 'subscribes a customer to a tea subscription' do
    customer_1 = Customer.create!(first_name: "Dave", last_name: "Davis", email: "dave@davedavis.com", address: "123 Davis Ct. Davis, MO 66666")
    tea_1 = Tea.create!(title: "Bengal Spice", description: "Herbal Tea, slightly sweet", temperature: "90", brew_time: "120")
    # subscription_1 = customer_1.subscriptions.create!(title: "Monthly Harvest", price: "22.48", status: "pending", frequency: "Monthly", tea_id: tea_1[:id])
    body = {  title: "Monthly Harvest", 
              price: "22.48", 
              frequency: "Monthly", 
              tea_id: tea_1[:id]
            }
    headers = { "Content-Type": "application/json", "Accept": "application/json" } 

    post "/api/v1/subscriptions", headers: headers, params: JSON.generate(subscription: body)

    expect(response).to be_successful
    
  end
end