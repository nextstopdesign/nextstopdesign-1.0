class UsersController < ApplicationController

  before_filter :authorize, :only => [:index, :edit, :update, :destroy]

  @birthdate = "20090101"

  def index   
    @users = User.all
    
    respond_to do |format|
            format.html
            format.xml { render :xml => @users }
            format.xls { send_data @users.to_xls }
    end
    
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def request_dob

  end
  
  def minor_waiver
    
  end

  def verify_dob

    @user = User.new(params[:user])
    session[:birthdate] = Date.civil(params[:user][:"birthdate(1i)"].to_i,params[:user][:"birthdate(2i)"].to_i,params[:user][:"birthdate(3i)"].to_i)
    user_age =  Date.today.year - params[:user][:"birthdate(1i)"].to_i

     
    if user_age < 13 then

      # user is under 13. No go.
      render :template => "users/unable_to_register"

    elsif user_age < 18 then

      # user is under 18. Needs to agree to the minor terms of use
      redirect_to(:action => 'minor_waiver')
      
    else

      # user is over 18. Needs to agree to the adult terms of use
      redirect_to(:action => 'adult_waiver')

    end

  end

  def verify_waiver
    render :template => "users/new"
  end

  def new
   @user = User.new(params[:user]) 
  end

  def create
    @user = User.new(params[:user])
    @user.birthdate = session[:birthdate]
    @user.verification_code = rand_str(16).upcase
    
    @user.ip_address = request.remote_ip
    
    if @user.public_transporation_use_when then
      @user.public_transporation_use_when = @user.public_transporation_use_when.join(", ")
    end
    
    if @user.public_transportation_use_why then
      @user.public_transportation_use_why = @user.public_transportation_use_why.join(", ")
    end
    
    if @user.reference then
      @user.reference = @user.reference.join(", ")
    end
     
    if @user.save
      
      # need to switch this over to check your email

      Emailer.deliver_verification_email(@user.first_name.to_s, @user.email.to_s, @user.verification_code.to_s)
      
      #Emailer.deliver_registration_confirmation(@user.first_name.to_s, @user.email.to_s, @user.username.to_s, @user.password.to_s)
      #flash[:notice] = 'One more step please.'
      
      #redirect_to login_path
      render :action => 'verification_sent'
      
    else
    
      render :action => 'new'
    
    end
  end
  
  def verification_sent
    
    
    
  end
  
  def verification_confirmed
    
  end
  
  def verification_failed
  
  end
  
  def verify
    
    session[:user_id] = User.verify(params[:id])
    
    if session[:user_id] > 0 then
        
      session[:user] = "user"      
      flash[:message] = "User verification successful. You are now logged into the site. Have fun."
      session[:verified] = "true"
      redirect_to :action => "verification_confirmed"

    else 

      flash[:notice] = "Sorry, we couldn't verify that user."
      session[:verified] = "false"
      redirect_to :action => "verification_failed"

    end
    
  end
  
  
end
