class SessionsController < ApplicationController

  def index
    
  end
  
  def new
    
  end
  
  def create

    session[:username] = params[:username].strip.downcase
    session[:password] = params[:password].strip.downcase

    case session[:password]  
    
      when "$msterd4m"  
        
        flash[:notice] = "You have successfully logged in as the admin."
        session[:user] = "admin"
        session[:user_id] = 1        
        redirect_to :controller => 'welcome'
      
      else
        
        # need to lookup the supplied username & password from the database
        
        session[:return_to]=request.request_uri
        session[:user_id] = User.authenticate(params[:username], params[:password])
                  
        if session[:user_id] > 0 then
          
          flash[:message] = "User login successful"
          session[:user] = "user"
          redirect_to :controller => "designs"
        
        else 
          
          flash[:notice] = "Incorrect username or password, please try again."
          redirect_to login_path   
    
        end
        
    end
    
  end
  
  def forgot
    
    @user = User.find(:first, :conditions=>["email = ?", params[:email]])
    
    if params[:email]
      
      if @user
      
        Emailer.deliver_forgot_username_password(@user.first_name.to_s, @user.email.to_s, @user.username.to_s, @user.password.to_s)
        flash[:notice] = "Check your email. We just sent a username and password reminder to " + @user.email.to_s
        redirect_to(login_path)
        
      else 
      
        flash[:notice] = "Sorry, we don't have record of that email address in our records. Please try again or contact us for help."      
    
      end
    
    end
    
  end
    
  def destroy
    reset_session
    flash[:notice] = "You successfully logged out"
    redirect_to login_path
  end


end
