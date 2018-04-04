class Dish < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :dishes, :uniqueness => { :message => "This dish already exists." }

  validates :dishes, :presence => { :message => "Name cannot be blank." }

end
