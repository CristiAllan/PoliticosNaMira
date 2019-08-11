class Politician < ApplicationRecord
  # Validations
  validates_presence_of :name, :political_party, :age, :work, :state, :image_url
end
