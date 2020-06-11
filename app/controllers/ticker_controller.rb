class TickerController < ApplicationController
    
    def index

        @news = Ticker.iex_news_call(params[:search])

        @iex_data = Ticker.iex_call(params[:search])

        @ticker = Ticker.stocks_call(params[:search])

        @iex_quote = Ticker.iex_quote(params[:search])
        
        render 'index'
    end
   
end
