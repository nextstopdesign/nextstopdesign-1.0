# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  before_filter :set_charset
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '0d7d1a153d3b635266b8c28ad97c9eb0'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  helper_method :admin?, :user?
     
  protected
  
  def rand_str(len)
    Array.new(len/2) { rand(256) }.pack('C*').unpack('H*').first
  end
  
  def admin?
    session[:password] == "$msterd4m"
  end
  
  def user?
    session[:user] == "user"
  end

  
  private

  def authorize
    unless admin?
      flash[:error] = "Not authorized to access this page. Please login first."
      redirect_to root_url
    end
  end
  

  def set_charset
    response.headers["Content-Type"] = "text/html; charset=utf-8"
  end
  
  
  
end
