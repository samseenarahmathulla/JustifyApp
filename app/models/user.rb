class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable, #confirmable - used to confirm reg by clickng on the link
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :linkedin] # Fb Authentication
         
  validates :first_name,  :presence => true
  validates :last_name,  :presence => true
  validates :role_id,  :presence => true
  
  
  belongs_to :role
  has_one :lawyer
  has_one :lawfirm
  
  
  # # Confirmation mail - send only to clients 
  # def send_confirmation_instructions
    # self.devise_mailer.confirmation_instructions(self).deliver
  # end
  
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user #if user already registered by g+ or fb or linkedin
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user #if registered user not by g+
        return registered_user
      else #if new user
        name = data["name"].split(" ")
        user = User.create(
          first_name: name[0],
          last_name: name[1],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: "12345678", #Devise.friendly_token[0,20],
          role_id: 2
        )
        return user
      end
   end
end
  
end
