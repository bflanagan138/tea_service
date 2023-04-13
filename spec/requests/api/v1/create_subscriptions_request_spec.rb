require 'rails_helper'

RSpec.describe "subscriptions" do
  it 'creates subscription' do
    customer_1 = Customer.create!(first_name: "Dave", last_name: "Davis", email: "dave@davedavis.com", address: "123 Davis Ct. Davis, MO 66666")
    tea_1 = Tea.create!(title: "Bengal Spice", description: "Herbal Tea, slightly sweet", temperature: 90, brew_time: 120)
    subscription_1 = customer_1.subscriptions.create!(title: "Monthly Harvest", price: 22.48, frequency: "Monthly", tea_id: tea_1.id, status: "active")
    # require 'pry'; binding.pry
    body = {  
              title: "Monthly Harvest", 
              price: 22.48, 
              frequency: "Monthly", 
              tea_id: tea_1.id,
              customer_id: customer_1.id
            }
    headers = { "Content-Type": "application/json", "Accept": "application/json" } 
    
    post "/api/v1/customers/#{customer_1.id}/subscriptions/", headers: headers, params: JSON.generate(body)

    data = JSON.parse(response.body, symbolize_names: true)
            
    expect(response).to be_successful
    expect(response.status).to eq 201
    parse = JSON.parse(response.body, symbolize_names: true)
    
    expect(parse).to be_a Hash
    expect(parse).to have_key (:data)
    expect(parse[:data]).to have_key (:id)
    expect(parse[:data][:id]).to be_a Integer
    expect(parse[:data]).to have_key (:title)
    expect(parse[:data][:title]).to be_a String
    expect(parse[:data]).to have_key (:price)
    expect(parse[:data][:price]).to be_a Float
    expect(parse[:data]).to have_key (:frequency)
    expect(parse[:data][:frequency]).to be_a String
    expect(parse[:data]).to have_key (:status)
    expect(parse[:data][:status]).to be_a String
    expect(parse[:data]).to have_key (:tea)
    expect(parse[:data][:tea]).to be_a Hash
    expect(parse[:data][:tea]).to have_key (:title)
    expect(parse[:data][:tea][:title]).to be_a String
    expect(parse[:data][:tea]).to have_key (:description)
    expect(parse[:data][:tea][:description]).to be_a String
    expect(parse[:data][:tea]).to have_key (:temperature)
    expect(parse[:data][:tea][:temperature]).to be_a Integer
    expect(parse[:data][:tea]).to have_key (:brew_time)
    expect(parse[:data][:tea][:brew_time]).to be_a Integer
  end
end