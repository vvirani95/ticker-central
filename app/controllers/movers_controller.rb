class MoversController < ApplicationController

    def index
        @indice = indice_call(['spy','dia','iwm'])

        render 'index'
    end

end
