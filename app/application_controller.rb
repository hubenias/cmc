require 'erb'
require_relative '../lib/coin'
require_relative '../lib/coin_market'

class ApplicationController
  def call(env)
    [200,
     {
       'Content-Type'  => 'text/html',
       'Cache-Control' => 'public, max-age=86400'
     },
     [response]
    ]
  end

  def response
    @coins = Coin.all
    @report = CoinMarket.report
    erb('index')
  end

  def erb(template)
    path = File.expand_path("../views/#{template}.html.erb", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end