class Ticker < ApplicationRecord

    def self.iex_call(ticker)
        uri = URI('https://cloud.iexapis.com/v1/stock/' + ticker + '/news/last/5?token=' + ENV["iex_api_key"]) 
        
        return(JSON.parse(Net::HTTP.get(uri)))
    end    

    def self.stocks_call(ticker)
        return(JSON.parse(Stock.new(ticker).d))
    end    

end
