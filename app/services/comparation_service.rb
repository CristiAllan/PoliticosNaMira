class ComparationService
  def self.comparation(politician1, politician2, winner)
    # Receber dois parâmetros p1 e p2
    jogador1 = Elo::Player.new(rating: politician1.score)
    jogador2 = Elo::Player.new(rating: politician2.score)
    
    # Fazer o jogo com a gem elo + saber o vencedor (usuário clicou)
    if winner == jogador1
      jogador1.wins_from(jogador2)
    elsif winner == jogador2
      jogador2.wins_from(jogador1)
    else
      raise 'Invalid params to winner'
    end
    
    # Associar rating dos players com os políticos
    politician1.update(score: jogador1.rating)
    politician2.update(score: jogador2.rating)
  end
end
