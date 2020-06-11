class MoversController < ApplicationController
    
    def index
        @indice = Mover.indice_call(['spy','dia','iwm'])

        @movers = Mover.movers_call()

        render 'index'
    end
         
end
