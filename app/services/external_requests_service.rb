require 'rest-client'
require 'json'

class ExternalRequestsService
  def self.list_deputies
    url = 'https://dadosabertos.camara.leg.br/api/v2/deputados?ordem=ASC&ordenarPor=nome'

    res = RestClient.get url, accept: :json

    JSON.parse(res.body).symbolize_keys[:dados]
  end

  def self.list_senators
    url = 'http://legis.senado.leg.br/dadosabertos/senador/lista/atual'

    res = RestClient.get url, content_type: :json, accept: :json

    JSON.parse(res.body).symbolize_keys[:ListaParlamentarEmExercicio]
        .symbolize_keys[:Parlamentares].symbolize_keys[:Parlamentar]
  end

  def self.get_age_political(id, senator = 0)
    if(senator == 0)
      url = "https://dadosabertos.camara.leg.br/api/v2/deputados/#{id}"
      res = RestClient.get url, content_type: :json, accept: :json
      deputieAge = Time.parse(JSON.parse(res.body).symbolize_keys[:dados].symbolize_keys[:dataNascimento])
    else
      url = "http://legis.senado.leg.br/dadosabertos/senador/#{id}"
      res = RestClient.get url, content_type: :json, accept: :json
      deputieAge = Time.parse(JSON.parse(res.body).symbolize_keys[:DetalheParlamentar].symbolize_keys[:Parlamentar]
        .symbolize_keys[:DadosBasicosParlamentar].symbolize_keys[:DataNascimento])
    end

    Time.now.year - deputieAge.year
  end
end
