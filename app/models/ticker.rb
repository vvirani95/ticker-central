class Ticker < ApplicationRecord

    def self.iex_call(ticker)
        uri = URI('https://cloud.iexapis.com/v1/stock/' + ticker + '/stats?token=' + ENV["iex_api_key"]) 
        
        return(JSON.parse(Net::HTTP.get(uri)))
    end    

    def self.stocks_call(ticker)
        return(JSON.parse(Stock.new(ticker).d))
    end    

    def self.iex_news_call(ticker)
        iex_uri = URI('https://cloud.iexapis.com/v1/stock/' + ticker + '/news/last/5?token=' + ENV["iex_api_key"])
        return(JSON.parse(Net::HTTP.get(iex_uri)))
    end    

    def self.iex_quote(ticker)
        quote_uri = URI('https://cloud.iexapis.com/v1/stock/' + ticker + '/book?token=' + ENV["iex_api_key"]) 
        
        return(JSON.parse(Net::HTTP.get(quote_uri)))
    end    

end
