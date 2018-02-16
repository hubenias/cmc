require 'open-uri'
require 'json'
require_relative 'coin'
require_relative 'coin_market'

class CoinMarketCapImporter
  URL = 'https://api.coinmarketcap.com/v1/ticker/'

  def import
    import_time = Time.now.utc
    Coin.all.each do |c|
      values = fetch_market_data(c['id'])
      values['time'] = import_time
      CoinMarket.create(values)
    end
  end

  private

  def fetch_market_data(coin_id)
    data = open(URL + coin_id).read
    JSON(data).first
  end
end

CoinMarketCapImporter.new.import # TODO: remove this after setup