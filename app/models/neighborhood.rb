class Neighborhood < ApplicationRecord
  # Direct associations

  has_many   :meals,
             :dependent => :destroy

  # Indirect associations

  has_many   :dishes,
             :through => :meals,
             :source => :dish

  has_many   :venues,
             :through => :meals,
             :source => :venue

  # Validations

end
