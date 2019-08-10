require 'rails_helper'

RSpec.describe Politician, type: :model do
  let(:politician) { build(:politician) }
  
  # validate_presence_of to all items
  [:name, :political_party, :age, :type, :state, :image_url].each do |field|
    it { should validate_presence_of(field) }
  end
  
  it { is_expected.to_not be_valid }
  it { expect(politician).to be_valid }
end
