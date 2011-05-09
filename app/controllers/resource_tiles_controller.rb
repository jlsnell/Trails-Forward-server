class ResourceTilesController < ApplicationController
  before_filter :authenticate_user!
  

  # GET /resource_tiles
  # GET /resource_tiles.xml
  def index
    @resource_tiles = ResourceTile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resource_tiles }
    end
  end

  # GET /resource_tiles/1
  # GET /resource_tiles/1.xml
  def show
    @resource_tile = ResourceTile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @resource_tile }
    end
  end

  # GET /resource_tiles/new
  # GET /resource_tiles/new.xml
  def new
    @resource_tile = ResourceTile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @resource_tile }
    end
  end

  # GET /resource_tiles/1/edit
  def edit
    @resource_tile = ResourceTile.find(params[:id])
  end

  # POST /resource_tiles
  # POST /resource_tiles.xml
  def create
    @resource_tile = ResourceTile.new(params[:resource_tile])

    respond_to do |format|
      if @resource_tile.save
        format.html { redirect_to(@resource_tile, :notice => 'Resource tile was successfully created.') }
        format.xml  { render :xml => @resource_tile, :status => :created, :location => @resource_tile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resource_tile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resource_tiles/1
  # PUT /resource_tiles/1.xml
  def update
    @resource_tile = ResourceTile.find(params[:id])

    respond_to do |format|
      if @resource_tile.update_attributes(params[:resource_tile])
        format.html { redirect_to(@resource_tile, :notice => 'Resource tile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resource_tile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_tiles/1
  # DELETE /resource_tiles/1.xml
  def destroy
    @resource_tile = ResourceTile.find(params[:id])
    @resource_tile.destroy

    respond_to do |format|
      format.html { redirect_to(resource_tiles_url) }
      format.xml  { head :ok }
    end
  end
end
