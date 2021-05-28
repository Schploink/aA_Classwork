class Api::SessionsController < ApplicationController

    protect_from_forgery only: [:create, :destroy]

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login(@user)
            render :show
        else
            render json: @user
        end
    end
    
    def destroy
        if logout
            render plain: 'nah'
        else 
            render plain: 'if only I worked - destory in sessions contorler', status: 404
        end
    end


end
