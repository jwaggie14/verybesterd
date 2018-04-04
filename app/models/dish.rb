class Dish < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :dishes, :presence => { :message => "Name cannot be blank." }

end
