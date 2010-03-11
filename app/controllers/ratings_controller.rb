class RatingsController < ApplicationController

  before_filter :authorize, :only => [:edit, :update, :destroy]

  def rate_design
    
    @design = Design.find(params[:id])
    
    #Rating.delete_all(["rateable_type = 'Design' AND rateable_id = ? AND user_id = ?", @design.id, session[:user_id].to_s])
    
    #@design.add_rating Rating.new(:rating => params[:rating], :user_id => session[:user_id].to_s, :ip_address => request.remote_ip)
    
    #flash[:notice] = "Thanks for rating this design."
    
    redirect_to @design

  end
  
  def rate_idea
    
    @idea = Idea.find(params[:id])
    
    #Rating.delete_all(["rateable_type = 'Idea' AND rateable_id = ? AND user_id = ?", @idea.id, session[:user_id].to_s])
    
    #@idea.add_rating Rating.new(:rating => params[:rating])
    
    #@idea.add_rating Rating.new(:rating => params[:rating], :user_id => session[:user_id].to_s, :ip_address => request.remote_ip)
    
    #flash[:notice] = "Thanks for rating this idea."
    
    redirect_to @idea

  end
  

end