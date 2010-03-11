class CommentsController < ApplicationController

  before_filter :authorize, :only => [:edit, :update, :destroy]

  def create
  
    @comment = Comment.new(params[:comment])
    @comment.ip_address = request.remote_ip
    
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Thank you for making a comment.'
        format.html { redirect_to(:back) }
      else
        flash[:notice] = 'Error creating comment.'
        format.html { redirect_to(:back) }
      end
    end

  end

  def index
    @comments = Comment.all
  end

  def approve
    Comment.update_all(["approved = ?", 1], :id => params[:comment_ids])
    params[:comment_ids]
    redirect_to comments_path
  end

end