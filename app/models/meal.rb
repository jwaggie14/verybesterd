class Meal < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood

  belongs_to :dish

  belongs_to :venue

  # Indirect associations

  # Validations

end
