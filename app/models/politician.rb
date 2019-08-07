class Politician < ApplicationRecord
  # Validations
  validates :name, :political_party, :age, :type, :state, :image_url, presence: true
end
