class TickerController < ApplicationController
    
    def index
        @news = Ticker.iex_call(params[:search])

        @ticker = Ticker.stocks_call(params[:search])
        
        render 'index'
    end
   
end
