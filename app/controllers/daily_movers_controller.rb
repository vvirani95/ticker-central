class DailyMoversController < ApplicationController
  def index
    @indice = indice_call(['spy','dia','iwm'])
    @movers = movers_call()
    render 'index'
  end
end
