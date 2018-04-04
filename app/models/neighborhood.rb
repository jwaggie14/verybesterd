class Neighborhood < ApplicationRecord
  # Direct associations

  has_many   :meals,
             :dependent => :destroy

  # Indirect associations

  has_many   :venues,
             :through => :meals,
             :source => :venue

  # Validations

end
