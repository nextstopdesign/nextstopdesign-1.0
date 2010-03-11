class IdeasController < ApplicationController

  before_filter :authorize, :only => [:create, :new, :edit, :update, :destroy]

  def index

    if params[:sort] then
      
      case params[:sort]
      when 'rated-high-to-low'

        @ideas = Idea.find_by_sql "SELECT ideas.*, avg(ratings.rating) AS rating, count(ratings.rating) AS votes
                                            FROM `ideas`
                                            LEFT JOIN ratings ON ideas.id = ratings.rateable_id
                                            WHERE (ratings.rateable_type = 'Idea')
                                            GROUP BY ratings.rateable_id
                                            ORDER BY rating DESC, votes DESC"

      when 'rated-low-to-high'

        @ideas = Idea.find_by_sql "SELECT ideas.*, avg(ratings.rating) AS rating, count(ratings.rating) AS votes
                                            FROM `ideas`
                                            LEFT JOIN ratings ON ideas.id = ratings.rateable_id
                                            WHERE (ratings.rateable_type = 'Idea')
                                            GROUP BY ratings.rateable_id
                                            ORDER BY rating ASC, votes DESC"

      when 'username'
        @ideas = Idea.find(:all, :include => [:ratings, :user], :order => "users.username ASC")
      else
        @ideas = Idea.find(:all, :include => :ratings, :order => "ratings.rating ASC")        
      end
      
    else
      @ideas = Idea.find(:all, :order => 'created_at DESC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.rss  { render :layout => false }
      format.xml  { render :xml => @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.xml
  def show
    
    @idea = Idea.find(params[:id])
            
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.xml
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.xml
  def create
    @idea = Idea.new(params[:idea])
    @idea.ip_address = request.remote_ip

    respond_to do |format|
      if @idea.save
        flash[:notice] = 'Idea was successfully created.'
        format.html { redirect_to(@idea) }
        format.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.xml
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        flash[:notice] = 'Idea was successfully updated.'
        format.html { redirect_to(@idea) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.xml
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to(ideas_url) }
      format.xml  { head :ok }
    end
  end
end
