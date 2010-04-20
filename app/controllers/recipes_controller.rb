class RecipesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :search, :search_by_ingredients, :show]
  
  # GET /recipes
  # GET /recipes.xml
  def index
    @recipes = Recipe.paginate(:per_page => 15, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
      format.js
    end
  end
  
  # GET /recipes/search/string
  # GET /recipes/search/string.xml
  def search
  	if request.post?
  		post = params[:recipe]
  		name = post[:name]
		@results = Recipe.search(name).paginate(:per_page => 10, :page => params[:page])
	else
		redirect_to :controller => 'index', :action => 'index'
		return
	end

    respond_to do |format|
      format.html # search.html.erb
      format.xml  { render :xml => @results }
      format.json { render :json => @results }
    end
  end
  
  # GET /recipes/search/string
  # GET /recipes/search/string.xml
  def search_by_ingredients
  	@ingredients = params[:ingredients]
  	@recipes = Recipe.find(:all)
  	#@recipes.each do |@recipe|
  		
  	#end
  	@results = Recipe.find(:all, :conditions => [ "ingredients_recpies_quantaties LIKE ?", @searchphrase])
	@results = Ingredient.search(params[:name])

    respond_to do |format|
      format.html # search.html.erb
      format.xml  { render :xml => @recipes }
      format.json { render :json => @results }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @quantities = @recipe.quantities

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
      format.json { render :json => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])
    @ingredients = params[:ingredients].split(",")
    @ingredientslist = []
    @ingredients.each do |arg|
    	@ingredient = arg
    	IngredientsRecipesQuantity.new(@recipe.id)
    	@ingredientslist.push(Ingredient.find(@ingredient))
    end
    @recipe.ingredients = @ingredientslist

    respond_to do |format|
      if @recipe.save
        flash[:notice] = 'Recipe was successfully created.'
        format.html { redirect_to(@recipe) }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        flash[:notice] = 'Recipe was successfully updated.'
        format.html { redirect_to(@recipe) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
    end
  end
end
