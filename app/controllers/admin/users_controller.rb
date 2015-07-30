class Admin::UsersController < ApplicationController

  before_filter :authorised

  def index
    @users = User.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    puts params[:is_admin].inspect
     if @user.save
       redirect_to admin_users_path, notice: "#{@user.firstname} created!"
     else
       render :new
     end
  end

  def destroy
    @user = User.find(params[:id])

    respond_to do |format|

      UserMailer.delete_email(@user)
   
          format.html { redirect_to(@user, notice: 'User was successfully deleted.') }

      @user.destroy
      redirect_to admin_users_path
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :is_admin)
  end

end
