class MegatilesController < ApplicationController
  # GET /megatiles
  # GET /megatiles.xml
  def index
    @megatiles = Megatile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @megatiles }
    end
  end

  # GET /megatiles/1
  # GET /megatiles/1.xml
  def show
    @megatile = Megatile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @megatile }
    end
  end

  # GET /megatiles/new
  # GET /megatiles/new.xml
  def new
    @megatile = Megatile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @megatile }
    end
  end

  # GET /megatiles/1/edit
  def edit
    @megatile = Megatile.find(params[:id])
  end

  # POST /megatiles
  # POST /megatiles.xml
  def create
    @megatile = Megatile.new(params[:megatile])

    respond_to do |format|
      if @megatile.save
        format.html { redirect_to(@megatile, :notice => 'Megatile was successfully created.') }
        format.xml  { render :xml => @megatile, :status => :created, :location => @megatile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @megatile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /megatiles/1
  # PUT /megatiles/1.xml
  def update
    @megatile = Megatile.find(params[:id])

    respond_to do |format|
      if @megatile.update_attributes(params[:megatile])
        format.html { redirect_to(@megatile, :notice => 'Megatile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @megatile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /megatiles/1
  # DELETE /megatiles/1.xml
  def destroy
    @megatile = Megatile.find(params[:id])
    @megatile.destroy

    respond_to do |format|
      format.html { redirect_to(megatiles_url) }
      format.xml  { head :ok }
    end
  end
end
