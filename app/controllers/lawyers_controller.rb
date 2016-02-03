class LawyersController < ApplicationController
  # before_action :authenticate_user!
  
  def index
  end
  
  def show
    @user = User.select("*").joins("LEFT JOIN lawyers on users.id = lawyers.user_id").where(:id => params[:id]).first
  end
  
  def edit
    
  end
  
  #updates field when the form is submited
  def update
    @user = User.find(params[:id]) 
    @lawyer = Lawyer.find_by_user_id(params[:id])
    
    if @user.update(user_params) 
      if @lawyer  #if lawyer exists then update
        @lawyer.update(lawyer_params)
      else  #if no lawyer, then create lawyer.
        @lawyer = Lawyer.new(lawyer_params)
        @lawyer.user_id = params[:id]
        @lawyer.save
      end
      redirect_to lawyer_path(params[:id])
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

def lawyer_params
  params.require(:user).permit(:area_of_practice, :lawfirm_id)
end


end
