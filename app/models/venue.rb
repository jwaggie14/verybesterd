class Venue < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :venue, :presence => { :message => "Name can't be blank." }

end
