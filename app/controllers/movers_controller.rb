class MoversController < ApplicationController
    
    def index
        @indice = Mover.indice_call(['spy','dia','iwm'])

        render 'index'
    end
         
end
