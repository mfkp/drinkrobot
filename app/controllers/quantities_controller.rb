class QuantitiesController < ApplicationController
  # GET /quantities
  # GET /quantities.xml
  def index
    @quantities = Quantities.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quantities }
    end
  end

  # GET /quantities/1
  # GET /quantities/1.xml
  def show
    @quantities = Quantities.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quantities }
    end
  end

  # GET /quantities/new
  # GET /quantities/new.xml
  def new
    @quantities = Quantities.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quantities }
    end
  end

  # GET /quantities/1/edit
  def edit
    @quantities = Quantities.find(params[:id])
  end

  # POST /quantities
  # POST /quantities.xml
  def create
    @quantities = Quantities.new(params[:quantities])

    respond_to do |format|
      if @quantities.save
        flash[:notice] = 'Quantities was successfully created.'
        format.html { redirect_to(@quantities) }
        format.xml  { render :xml => @quantities, :status => :created, :location => @quantities }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quantities.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quantities/1
  # PUT /quantities/1.xml
  def update
    @quantities = Quantities.find(params[:id])

    respond_to do |format|
      if @quantities.update_attributes(params[:quantities])
        flash[:notice] = 'Quantities was successfully updated.'
        format.html { redirect_to(@quantities) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quantities.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quantities/1
  # DELETE /quantities/1.xml
  def destroy
    @quantities = Quantities.find(params[:id])
    @quantities.destroy

    respond_to do |format|
      format.html { redirect_to(quantities_url) }
      format.xml  { head :ok }
    end
  end
end
