class StaticPagesController < ApplicationController
  def crypto
    @crypto = crypto_call()


    respond_to do |format|
     format.html { render :crypto }
    end

  end

  def news
    @news = iex_news_alone_call("SPY")

    respond_to do |format|
     format.html { render :news }
    end
  end
end
