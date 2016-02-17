class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  # TODO: make a common method and put the diff providers as an array and loop thru.
  
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user] = @user
    if @user.persisted?
      # sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      # redirect_to new_user_registration_url
    end
    redirect_to after_sign_in_path_for(@user)
  end
  
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user] = @user
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
      end
      redirect_to after_sign_in_path_for(@user)
  end
  
  def linkedin
    @user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user] = @user
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Linkedin"
      else
        session["devise.linkedin_data"] = request.env["omniauth.auth"]
      end
      redirect_to after_sign_in_path_for(@user)
  end

  def failure
    redirect_to root_path
  end
end