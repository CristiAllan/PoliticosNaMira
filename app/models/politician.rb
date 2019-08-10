class Politician < ApplicationRecord
  # Validations
  validates_presence_of :name, :political_party, :age, :type, :state, :image_url

  #to save the :type in DB need disable the STI
  self.inheritance_column = :sti_disabled
end
