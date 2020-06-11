class Mover < ApplicationRecord
    
    def self.indice_call(ticker_arr)
    
        indice = []

        ticker_arr.each do |x|
            uri = URI('https://cloud.iexapis.com/v1/stock/' + x + '/quote/latestPrice?token=' + ENV["iex_api_key"]) 
            indice << JSON.parse(Net::HTTP.get(uri))
        end

        return(indice)
        
    end   

    def self.movers_call
        uri_movers_gainers = URI('https://cloud.iexapis.com/v1/stock/market/list/gainers?listLimit=5&token=' + ENV["iex_api_key"])
        uri_movers_losers = URI('https://cloud.iexapis.com/v1/stock/market/list/losers?listLimit=6&token=' + ENV["iex_api_key"])

        movers_gainers = JSON.parse(Net::HTTP.get(uri_movers_gainers))
        movers_losers = JSON.parse(Net::HTTP.get(uri_movers_losers))


        return([movers_gainers, movers_losers])
    end    

end
