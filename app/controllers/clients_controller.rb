class ClientsController < ApplicationController
  # before_action :authenticate_user!
  
  def index
  end
  
  def show
    @user = User.find(params[:id]) 
  end
  
  def edit
    
  end
  
  #updates field when the form is submited
  def update
    @user = User.find(params[:id]) 
    if @user.update(user_params) 
      redirect_to client_path(params[:id])
    else 
      render 'show'
    end
  end
  
  def check_email
    @user = User.select("*").where("email = '#{params[:email]}' and id != '#{params[:id]}'")
    msg = ""
    if @user.count >= 1
      msg = "Email has already been taken"
    else
      msg = ""
    end    
    if request.xhr?
       render :json => { :message => msg }
    end
  end
  
private
def user_params
  params.require(:user).permit(:first_name,:last_name, :email, :password, :country, :zipcode, :phone)
end

  
end
