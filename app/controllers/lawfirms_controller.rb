class LawfirmsController < ApplicationController
  # before_action :authenticate_user!
  
  def index
  end
  
  def show
    @user = User.select("*").joins("LEFT JOIN lawfirms on users.id = lawfirms.user_id").where(:id => params[:id]).first
  end
  
  def edit
    
  end
  
  #updates field when the form is submited
  def update
    @user = User.find(params[:id]) 
    @lawfirm = Lawfirm.find_by_user_id(params[:id])
    
    if @user.update(user_params) 
      if @lawfirm  #if lawfirm exists then update
        @lawfirm.update(lawfirm_params)
      else  #if no lawfirm, then create lawfirm.
        @lawfirm = Lawfirm.new(lawfirm_params)
        @lawfirm.user_id = params[:id]
        @lawfirm.save
      end
      redirect_to lawfirm_path(params[:id])
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

def lawfirm_params
  params.require(:user).permit(:name_of_firm, :area_of_practice, :phone_of_firm)
end


end
