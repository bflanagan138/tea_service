require 'rails_helper'

RSpec.describe "cancel customer subscription" do
  it "cancels a customer subscription" do
    customer_1 = Customer.create!(first_name: "Dave", last_name: "Davis", email: "dave@davedavis.com", address: "123 Davis Ct. Davis, MO 66666")
    tea_1 = Tea.create!(title: "Bengal Spice", description: "Herbal Tea, slightly sweet", temperature: 90, brew_time: 120)
    tea_2 = Tea.create!(title: "Black", description: "High Caffeine", temperature: 88, brew_time: 100)
    tea_3 = Tea.create!(title: "Chamomile", description: "Mild, herbal tea", temperature: 140, brew_time: 75)
    subscription_1 = customer_1.subscriptions.create!(title: "Monthly Harvest", price: 22.48, frequency: "Monthly", tea_id: tea_1.id, status: "active")
    subscription_2 = customer_1.subscriptions.create!(title: "Weekly Wakeup", price: 15.85, frequency: "Weekly", tea_id: tea_2.id, status: "active")
    subscription_3 = customer_1.subscriptions.create!(title: "Sleepytime", price: 19.88, frequency: "Monthly", tea_id: tea_3.id, status: "active")
    
    update_params = {
                    status: "cancelled"
    }

    patch "/api/v1/customers/#{customer_1.id}/subscriptions/#{subscription_1.id}", headers: headers, params: JSON.generate(update_params)
    
    parse = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(parse).to be_a Hash
    expect(parse).to have_key (:id)
    expect(parse[:id]).to be_a Integer
    expect(parse).to have_key (:title)
    expect(parse[:title]).to be_a String
    expect(parse).to have_key (:status)
    expect(parse[:status]).to be_a String
    expect(parse[:status]).to eq "cancelled"
  end
end