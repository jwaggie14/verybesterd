class Dish < ApplicationRecord
  # Direct associations

  has_many   :meals,
             :dependent => :destroy

  # Indirect associations

  has_many   :neighborhoods,
             :through => :meals,
             :source => :neighborhood

  has_many   :venues,
             :through => :meals,
             :source => :venue

  # Validations

  validates :dishes, :uniqueness => { :message => "This dish already exists." }

  validates :dishes, :presence => { :message => "Name cannot be blank." }

end
