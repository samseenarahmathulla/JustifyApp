class UsersController < ApplicationController

  def new
  end

  def create
    puts "=======create------"
  end

  def check_email
    @user = User.find_by_email(params[:email])
    if @user
      msg = "Email has already been taken"
    else
      msg = ""
    end    
     if request.xhr?
        render :json => { :message => msg }
     end
  end
  
# private
# 
  # def user_params
    # params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end
end