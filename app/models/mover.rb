class Mover < ApplicationRecord
    
    def self.indice_call(ticker_arr)
    
        indice = []

        ticker_arr.each do |x|
            uri = URI('https://cloud.iexapis.com/v1/stock/' + x + '/quote/latestPrice?token=' + ENV["iex_api_key"]) 
            indice << JSON.parse(Net::HTTP.get(uri))
        end

        return(indice)
        
    end   

end
