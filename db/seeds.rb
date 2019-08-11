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
  
  name = political["nome"]
  political_party = political["siglaPartido"]
  age = ExternalRequestsService.get_age_political political["id"]
  type =  "Deputado"
  state = political["siglaUf"]
  image_url = political["urlFoto"]
  
  Politician.create({name: name,political_party: political_party,age: age,type: type,state: state,image_url: image_url})

end

senators.each do |political|
  name = political["IdentificacaoParlamentar"]["NomeCompletoParlamentar"]
  political_party = political["IdentificacaoParlamentar"]["SiglaPartidoParlamentar"]
  age = ExternalRequestsService.get_age_political political["IdentificacaoParlamentar"]["CodigoParlamentar"],1
  type =  political["IdentificacaoParlamentar"]["FormaTratamento"]
  state = political["IdentificacaoParlamentar"]["UfParlamentar"]
  image_url = political["IdentificacaoParlamentar"]["UrlFotoParlamentar"]
  
  Politician.create({name: name,political_party: political_party,age: age,type: type,state: state,image_url: image_url})
end
