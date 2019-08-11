require 'rails_helper'
require 'elo'

RSpec.describe ComparationService do
  describe '#comparation', :vcr do
    it 'returns a new score to politicians' do
      politician1 = create(:politician)
      politician2 = create(:politician)

      p1_score_before_game = politician1.score
      p2_score_before_game = politician2.score

      jogador1 = Elo::Player.new(rating: politician1.score)
      jogador2 = Elo::Player.new(rating: politician2.score)

      jogador1.wins_from(jogador2)

      politician1.score = jogador1.rating
      politician2.score = jogador2.rating

      expect(politician1.score).to_not eq(p1_score_before_game)
      expect(politician2.score).to_not eq(p2_score_before_game)
    end
  end
end
