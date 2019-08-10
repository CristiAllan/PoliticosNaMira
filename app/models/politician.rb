class Politician < ApplicationRecord
  # Validations
  validates_presence_of :name, :political_party, :age, :type, :state, :image_url
end
