class MegatilesController < ApplicationController
  
  respond_to :xml, :json
  
  # GET /megatiles
  # GET /megatiles.xml
  def index
    @world = World.find(params[:world_id])
    if params.has_key? :x_min
      @megatiles = Megatile.where(:world_id => @world.id).where("x >= :x_min AND x<= :x_max AND y>=:y_min AND y<=:y_max", 
       {:x_min => params[:x_min], :x_max => params[:x_max], :y_min => params[:y_min], :y_max => params[:y_max]})
    else
      @megatiles = @world.megatiles
    end
    respond_to do |format|
      format.xml  { render_for_api :megatile_with_resources, :xml  => @megatiles, :root => :megatiles  }
      format.json { render_for_api :megatile_with_resources, :json => @megatiles, :root => :megatiles  }
    end
  end

  # GET /megatiles/1
  # GET /megatiles/1.xml
  def show
    @megatile = Megatile.find(params[:id])

    respond_to do |format|
      format.xml  { render_for_api :megatile_with_resources, :xml  => @megatile, :root => :megatile  }
      format.json { render_for_api :megatile_with_resources, :json => @megatile, :root => :megatile  }
    end
  end

  # # GET /megatiles/new
  # # GET /megatiles/new.xml
  # def new
  #   @megatile = Megatile.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @megatile }
  #   end
  # end
  # 
  # # GET /megatiles/1/edit
  # def edit
  #   @megatile = Megatile.find(params[:id])
  # end
  # 
  # # POST /megatiles
  # # POST /megatiles.xml
  # def create
  #   @megatile = Megatile.new(params[:megatile])
  # 
  #   respond_to do |format|
  #     if @megatile.save
  #       format.html { redirect_to(@megatile, :notice => 'Megatile was successfully created.') }
  #       format.xml  { render :xml => @megatile, :status => :created, :location => @megatile }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @megatile.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # PUT /megatiles/1
  # # PUT /megatiles/1.xml
  # def update
  #   @megatile = Megatile.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @megatile.update_attributes(params[:megatile])
  #       format.html { redirect_to(@megatile, :notice => 'Megatile was successfully updated.') }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @megatile.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /megatiles/1
  # # DELETE /megatiles/1.xml
  # def destroy
  #   @megatile = Megatile.find(params[:id])
  #   @megatile.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(megatiles_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
