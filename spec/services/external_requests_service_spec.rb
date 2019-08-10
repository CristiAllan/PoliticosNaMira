require 'rails_helper'

RSpec.describe ExternalRequestsService do
  describe '#list_deputies', :vcr do
    it 'returns a list of deputies' do
      res = described_class.list_deputies

      expect(res).to be_a Array
      expect(res.first).to be_a Hash
    end
  end

  describe '#list_senators', :vcr do
    it 'returns a list of senators' do
      res = described_class.list_senators

      expect(res).to be_a Array
      expect(res.first).to be_a Hash
    end
  end
end
