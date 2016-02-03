class HomeController < ApplicationController
  # before_action :authenticate_user!
  
  def index
  end
  
  def forgot_password
    @user = User.select("*").where("email = '#{params[:email]}'")
    msg = ""
    if params[:email] != "" 
      if @user.count >= 1
        msg = "Reset password instructions has been sent to your email id."
      else
        msg = "User not found!"
      end    
    else
      msg = "Please enter your email."
    end
    if request.xhr?
       render :json => { :message => msg }
       # TODO: call mailer and send reset pwd instructions.
    end
  end
end
