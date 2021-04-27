class UsersController < ApplicationController
  before_action :require_logout, only:[:new, :create]
  before_action :require_login, only:[:index, :show]

  def index
    @users = User.all
  end

  def new
  end

  
end
