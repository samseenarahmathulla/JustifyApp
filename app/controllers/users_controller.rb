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
  
  # Forgot Password
  def generate_new_password_email
      user = User.find(params[:user_id])
      user.send_reset_password_instructions
      flash[:notice] = "Reset password instructions have been sent to #{user.email}."
      redirect_to '/'
   end
  
# private
# 
  # def user_params
    # params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end
end