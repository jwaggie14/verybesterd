class Venue < ApplicationRecord
  # Direct associations

  has_many   :meals,
             :dependent => :destroy

  # Indirect associations

  has_many   :dishes,
             :through => :meals,
             :source => :dish

  # Validations

  validates :venue, :uniqueness => { :message => "Venue already exists." }

  validates :venue, :presence => { :message => "Name can't be blank." }

end
