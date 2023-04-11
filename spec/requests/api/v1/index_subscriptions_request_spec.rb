require 'rails_helper'

RSpec.describe "customer subscriptions" do
  it 'lists all subscriptions for a customer' do
    customer_1 = Customer.create!(first_name: "Dave", last_name: "Davis", email: "dave@davedavis.com", address: "123 Davis Ct. Davis, MO 66666")
    customer_2 = Customer.create!(first_name: "Tom", last_name: "Thomas", email: "tom@tomthomas.net", address: "456 Thomas Ct. Thomas, FL 33333")
    customer_3 = Customer.create!(first_name: "Rod", last_name: "Roddy", email: "rod@rodroddy.edu", address: "789 Rod Ct. Roddy, AK 99999")
    tea_1 = Tea.create!(title: "Bengal Spice", description: "Herbal Tea, slightly sweet", temperature: 90, brew_time: 120)
    tea_2 = Tea.create!(title: "Black", description: "High Caffeine", temperature: 88, brew_time: 100)
    tea_3 = Tea.create!(title: "Chamomile", description: "Mild, herbal tea", temperature: 140, brew_time: 75)
    subscription_1 = customer_1.subscriptions.create!(title: "Monthly Harvest", price: 22.48, frequency: "Monthly", tea_id: tea_1.id, status: "active")
    subscription_2 = customer_1.subscriptions.create!(title: "Weekly Wakeup", price: 15.85, frequency: "Weekly", tea_id: tea_2.id, status: "cancelled")
    subscription_3 = customer_1.subscriptions.create!(title: "Sleepytime", price: 19.88, frequency: "Monthly", tea_id: tea_3.id, status: "active")
    subscription_4 = customer_2.subscriptions.create!(title: "Sleepytime", price: 19.88, frequency: "Monthly", tea_id: tea_3.id, status: "active")

    get "/api/v1/customers/#{customer_3.id}/subscriptions"

    data = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(data).to be_a Hash
    expect(data).to have_key (:error)
    expect(data[:error]).to eq "No Subscriptions Found"
    
    get "/api/v1/customers/#{customer_1.id}/subscriptions"
    parse = JSON.parse(response.body, symbolize_names: true)

    expect(parse).to be_a Hash
    expect(parse).to have_key (:data)
    expect(parse[:data]).to have_key (:id)
    expect(parse[:data][:id]).to be_a Integer
    expect(parse[:data]).to have_key (:attributes)
    expect(parse[:data][:attributes]).to be_a Hash
    expect(parse[:data][:attributes]).to have_key (:first_name)
    expect(parse[:data][:attributes][:first_name]).to be_a String
    expect(parse[:data][:attributes]).to have_key (:last_name)
    expect(parse[:data][:attributes][:last_name]).to be_a String
    expect(parse[:data][:attributes]).to have_key (:email)
    expect(parse[:data][:attributes][:email]).to be_a String
    expect(parse[:data][:attributes]).to have_key (:address)
    expect(parse[:data][:attributes][:address]).to be_a String
    expect(parse[:data][:attributes]).to have_key (:subscriptions)
    expect(parse[:data][:attributes][:subscriptions]).to be_a Array
    parse[:data][:attributes][:subscriptions].each do |sub|
      expect(sub).to be_a Hash
      expect(sub).to have_key (:title)
      expect(sub[:title]).to be_a String
      expect(sub).to have_key (:price)
      expect(sub[:price]).to be_a Float
      expect(sub).to have_key (:status)
      expect(sub[:status]).to be_a String
      expect(sub).to have_key (:frequency)
      expect(sub[:frequency]).to be_a String
    end
  end
end