class Venue < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :venue, :uniqueness => { :message => "Venue already exists." }

  validates :venue, :presence => { :message => "Name can't be blank." }

end
