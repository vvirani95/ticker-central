class TickerController < ApplicationController

    def index

        @news = iex_news_call(params[:search])

        @iex_data = iex_call(params[:search])

        @ticker = stocks_call(params[:search])

        @iex_quote = iex_quote(params[:search])

        render 'index'
    end

end
