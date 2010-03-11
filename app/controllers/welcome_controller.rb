class WelcomeController < ApplicationController

  def index

    @show_splash = true
    
    #@top = Design.find(:first, :include => :ratings, :order => "ratings.rating", :limit => 1)

    @top = Design.find(:first,
                        :select => "designs.*, avg(ratings.rating) AS rating, count(ratings.rating) AS votes",
                        :joins => "LEFT JOIN ratings ON designs.id = ratings.rateable_id",
                        :conditions => "ratings.rateable_type = 'Design'",
                        :group => "ratings.rateable_id",
                        :order => "rating DESC, votes DESC",
                        :limit => 1)
                        
    @top = Design.find(:first, :order => "created_at DESC")
    
    #@top_designs = Design.find(:all, :include => :ratings, :order => "ratings.rating DESC", :limit => 6, :offset => 1)

    @top_designs = Design.find(:all,
                        :select => "designs.*, avg(ratings.rating) AS rating, count(ratings.rating) AS votes, photo1_file_name AS photo1_file_name",
                        :joins => "LEFT JOIN ratings ON designs.id = ratings.rateable_id",
                        :conditions => "ratings.rateable_type = 'Design'",
                        :group => "ratings.rateable_id",
                        :order => "rating DESC, votes DESC",
                        :limit => 6)

    @top_designs = Design.find(:all, :order => "created_at DESC", :limit => 6, :offset => 1)

    @number_of_designs = Design.count
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @welcome }
    end
  
  end

end
