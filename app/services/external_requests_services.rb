require 'rest-client'
require 'json'

class ExternalRequestsServices
  def self.list_deputies
    url = 'https://dadosabertos.camara.leg.br/api/v2/deputados?ordem=ASC&ordenarPor=nome'

    res = RestClient.get url, accept: :json

    res[:dados]
  end

  def self.list_senators
    url = 'http://legis.senado.leg.br/dadosabertos/senador/lista/atual'

    res = RestClient.get url, content_type: :json, accept: :json

    res['ListaParlamentarEmExercicio']
  end
end
