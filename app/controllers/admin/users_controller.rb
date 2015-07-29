class Admin::UsersController < ApplicationController

    before_filter :authorised

  def index
    @users = User.page(params[:page]).per(3)
  end

end
