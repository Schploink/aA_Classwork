class Api::UsersController < ApplicationController

    protect_from_forgery only: [:create]

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            render :show
        else
            render json: @user
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
