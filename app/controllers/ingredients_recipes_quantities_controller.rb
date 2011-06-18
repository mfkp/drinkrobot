class IngredientsRecipesQuantitiesController < ApplicationController
  # GET /ingredients_recipes_quantities
  # GET /ingredients_recipes_quantities.xml
  def index
    @ingredients_recipes_quantities = IngredientsRecipesQuantity.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ingredients_recipes_quantities }
    end
  end

  # GET /ingredients_recipes_quantities/1
  # GET /ingredients_recipes_quantities/1.xml
  def show
    @ingredients_recipes_quantities = IngredientsRecipesQuantity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingredients_recipes_quantities }
    end
  end

  # GET /ingredients_recipes_quantities/new
  # GET /ingredients_recipes_quantities/new.xml
  def new
    @ingredients_recipes_quantities = IngredientsRecipesQuantity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ingredients_recipes_quantities }
    end
  end

  # GET /ingredients_recipes_quantities/1/edit
  def edit
    @ingredients_recipes_quantities = IngredientsRecipesQuantity.find(params[:id])
  end

  # POST /ingredients_recipes_quantities
  # POST /ingredients_recipes_quantities.xml
  def create
    @ingredients_recipes_quantities = IngredientsRecipesQuantity.new(params[:ingredients_recipes_quantities])

    respond_to do |format|
      if @ingredients_recipes_quantities.save
        flash[:notice] = 'IngredientsRecipesQuantities was successfully created.'
        format.html { redirect_to(@ingredients_recipes_quantities) }
        format.xml  { render :xml => @ingredients_recipes_quantities, :status => :created, :location => @ingredients_recipes_quantities }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ingredients_recipes_quantities.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ingredients_recipes_quantities/1
  # PUT /ingredients_recipes_quantities/1.xml
  def update
    @ingredients_recipes_quantities = IngredientsRecipesQuantity.find(params[:id])

    respond_to do |format|
      if @ingredients_recipes_quantities.update_attributes(params[:ingredients_recipes_quantities])
        flash[:notice] = 'IngredientsRecipesQuantities was successfully updated.'
        format.html { redirect_to(@ingredients_recipes_quantities) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ingredients_recipes_quantities.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients_recipes_quantities/1
  # DELETE /ingredients_recipes_quantities/1.xml
  def destroy
    @ingredients_recipes_quantities = IngredientsRecipesQuantity.find(params[:id])
    @ingredients_recipes_quantities.destroy

    respond_to do |format|
      format.html { redirect_to(ingredients_recipes_quantity_url) }
      format.xml  { head :ok }
    end
  end
end
