class ApplicationController < ActionController::Base

  
  require 'net/http'


  $api_key = Rails.application.credentials.iex[:iex_api_key]

  def indice_call(ticker_arr)
      indice = []

      ticker_arr.each do |x|
          uri = URI('https://cloud.iexapis.com/v1/stock/' + x + '/quote/latestPrice?token=' + $api_key)
          indice << JSON.parse(Net::HTTP.get(uri))
      end

      return(indice)
  end

  def movers_call
      uri_movers_gainers = URI('https://cloud.iexapis.com/v1/stock/market/list/gainers?listLimit=5&token=' + $api_key)
      uri_movers_losers = URI('https://cloud.iexapis.com/v1/stock/market/list/losers?listLimit=5&token=' + $api_key)

      movers_gainers = JSON.parse(Net::HTTP.get(uri_movers_gainers))
      movers_losers = JSON.parse(Net::HTTP.get(uri_movers_losers))


      return([movers_gainers, movers_losers])
  end

  def iex_call(ticker)
      uri = URI('https://cloud.iexapis.com/v1/stock/' + ticker + '/stats?token=' + $api_key)

      return(JSON.parse(Net::HTTP.get(uri)))
  end

  def stocks_call(ticker)
      return(JSON.parse(Stock.new(ticker).d))
  end

  def iex_news_call(ticker)
      iex_uri = URI('https://cloud.iexapis.com/v1/stock/' + ticker + '/news/last/5?token=' + $api_key)
      return(JSON.parse(Net::HTTP.get(iex_uri)))
  end

  def iex_news_alone_call(ticker)
      iex_uri = URI('https://cloud.iexapis.com/v1/stock/' + ticker + '/news/last/20?token=' + $api_key)
      return(JSON.parse(Net::HTTP.get(iex_uri)))
  end

  def iex_quote(ticker)
      quote_uri = URI('https://cloud.iexapis.com/v1/stock/' + ticker + '/book?token=' + $api_key)

      return(JSON.parse(Net::HTTP.get(quote_uri)))
  end

  def crypto_call

    listtest = []
    uri_list = URI('https://cloud.iexapis.com/v1/ref-data/crypto/symbols?token=' + $api_key)
    crypto_list = []

    listtest << (JSON.parse(Net::HTTP.get(uri_list)))

    # (JSON.parse(Net::HTTP.get(uri_list))).each do |x|
    #   listtest << x.where?(currency="USD")
    # end

    # return(listtest)
    listtest.each do |crypt|

        crypt.each do |c|
          if c["name"].include?("to USDT")
            crypto_list << c["symbol"]
          end
        end


    end

    # crypto_list = ["btcusd", "ethusd", "ltcusd"]
    data_array = []

    crypto_list[0..14].each do |x|
      uri_crypto = URI('https://cloud.iexapis.com/v1/crypto/' + x + '/price?token=' + $api_key)

      data_array << (JSON.parse(Net::HTTP.get(uri_crypto)))
    end

    return(data_array)

  end

end
