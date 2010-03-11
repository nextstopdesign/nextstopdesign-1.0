class DesignsController < ApplicationController

  before_filter :authorize, :only => [:edit, :update, :destroy]

  def index
    
    if params[:sort] then
      
      case params[:sort]
      when 'rated-high-to-low'
        
        @designs = Design.find_by_sql "SELECT designs.*, avg(ratings.rating) AS rating, count(ratings.rating) AS votes
                                            FROM `designs`
                                            LEFT JOIN ratings ON designs.id = ratings.rateable_id
                                            WHERE (ratings.rateable_type = 'Design')
                                            GROUP BY ratings.rateable_id
                                            ORDER BY rating DESC, votes DESC"
                
      when 'rated-low-to-high'
        
        
        @designs = Design.find_by_sql "SELECT designs.*, avg(ratings.rating) AS rating, count(ratings.rating) AS votes
                                            FROM `designs`
                                            LEFT JOIN ratings ON designs.id = ratings.rateable_id
                                            WHERE (ratings.rateable_type = 'Design')
                                            GROUP BY ratings.rateable_id
                                            ORDER BY rating ASC, votes DESC"
        

      when 'username'
        @designs = Design.find(:all, :include => [:ratings, :user], :order => "users.username ASC")

      when 'design-title'
        @designs = Design.find(:all, :order => "title")

      when 'most-recent-first'
        @designs = Design.find(:all, :order => "created_at DESC")

      else
        @designs = Design.find(:all, :include => :ratings, :order => "ratings.rating ASC")        

      end
      
    else
      #@designs = Design.find(:all, :order => "RAND()")

      @designs = Design.find_by_sql "SELECT designs.*, avg(ratings.rating) AS rating, count(ratings.rating) AS votes
                                          FROM `designs`
                                          LEFT JOIN ratings ON designs.id = ratings.rateable_id
                                          WHERE (ratings.rateable_type = 'Design')
                                          GROUP BY ratings.rateable_id
                                          ORDER BY rating DESC, votes DESC"


    end
        
    respond_to do |format|
      format.html # index.html.erb
      format.rss  { render :layout => false }
      format.xml  { render :xml => @designs }
    end
  end

  # GET /designs/1
  # GET /designs/1.xml
  def show
    @design = Design.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @design }
    end
  end

  # GET /designs/new
  # GET /designs/new.xml
  def new
    @design = Design.new
        
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @design }
    end
  end

  # GET /designs/1/edit
  def edit
    @design = Design.find(params[:id])
  end

  # POST /designs
  # POST /designs.xml
  def create
    @design = Design.new(params[:design])
    @design.ip_address = request.remote_ip

    respond_to do |format|
      if @design.save
        flash[:notice] = 'Design was successfully created. Be sure to <strong>email your friends and colleges</strong> to tell them to visit the site and rate your design.'
        format.html { redirect_to(@design) }
        format.xml  { render :xml => @design, :status => :created, :location => @design }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @design.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /designs/1
  # PUT /designs/1.xml
  def update
        
    @design = Design.find(params[:id])
    
    respond_to do |format|
      if @design.update_attributes(params[:design])
        flash[:notice] = 'Design was successfully updated.'
        format.html { redirect_to(@design) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @design.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /designs/1
  # DELETE /designs/1.xml
  def destroy
    @design = Design.find(params[:id])
    @design.destroy

    respond_to do |format|
      format.html { redirect_to(designs_url) }
      format.xml  { head :ok }
    end
  end
end
