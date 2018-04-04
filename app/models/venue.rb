require 'open-uri'
class Venue < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :meals,
             :dependent => :destroy

  # Indirect associations

  has_many   :neighborhoods,
             :through => :meals,
             :source => :neighborhood

  has_many   :dishes,
             :through => :meals,
             :source => :dish

  # Validations

  validates :venue, :uniqueness => { :message => "Venue already exists." }

  validates :venue, :presence => { :message => "Name can't be blank." }

end
