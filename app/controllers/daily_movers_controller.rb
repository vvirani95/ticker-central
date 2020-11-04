class DailyMoversController < ApplicationController
  def index
    @indice = indice_call(['spy','dia','rut'])
    @movers = movers_call()
    render 'index'
  end
end
