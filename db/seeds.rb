# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


deputies = ExternalRequestsService.list_deputies
senators = ExternalRequestsService.list_senators

deputies.each do |political|
  Politician.new.tap do |deputie|
    deputie.name = political["nome"]
    deputie.political_party = political["siglaPartido"]
    deputie.age = ExternalRequestsService.get_age_political political["id"]
    deputie.kind =  "Deputado"
    deputie.state = political["siglaUf"]
    deputie.image_url = political["urlFoto"]
    deputie.save!
  end
end

senators.each do |political|
  Politician.new.tap do |senator|
    senator.name = political["IdentificacaoParlamentar"]["NomeCompletoParlamentar"]
    if political["IdentificacaoParlamentar"]["SiglaPartidoParlamentar"].present?
      senator.political_party = political["IdentificacaoParlamentar"]["SiglaPartidoParlamentar"]
    else
      senator.political_party = "Sem Partido"
    end
    senator.age = ExternalRequestsService.get_age_political political["IdentificacaoParlamentar"]["CodigoParlamentar"],1
    senator.kind =  political["IdentificacaoParlamentar"]["FormaTratamento"]
    senator.state = political["IdentificacaoParlamentar"]["UfParlamentar"]
    senator.image_url = political["IdentificacaoParlamentar"]["UrlFotoParlamentar"]
    senator.save!
  end
end