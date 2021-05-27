class Api::SessionsController < ApplicationController

    
    def destroy
        if logout
            render {}
        else 
            render {}, status: 404
        end
    end


end
