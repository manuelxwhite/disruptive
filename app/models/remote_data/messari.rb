require 'httparty'

module RemoteData
  class Messari
    MESSARI_ENDPOINT = 'https://data.messari.io/api/v1'.freeze

    def self.get_price(symbol)
      response = HTTParty.get("#{MESSARI_ENDPOINT}/assets/#{symbol}/metrics")
      data = JSON.parse(response.body)
      data['data']['market_data']['price_usd']
    rescue HTTParty::Error
      0
    end
  end
end
