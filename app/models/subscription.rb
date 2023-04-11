class Subscription < ApplicationRecord
  validates_presence_of :title,
                        :price,
                        :status,
                        :frequency

  belongs_to :customer
  belongs_to :tea

  def self.status(id, status)
    require 'pry'; binding.pry
  end
end