class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def new
    @rating = Rating.find(params[:rating_id])
    @recipe = @rating.recipes.new
    render :new
  end

  def create
    @rating = Rating.find(params[:rating_id])
    @recipe = @rating.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe succesfully added! MMMMMMmmmmmm!"
      redirect_to rating_path(@rating)
    else
      render :new
    end
  end

  def show
    @rating = Rating.find(params[:rating_id])
    @recipe = Recipe.find(params[:id])
    render :show
  end

  def edit
    @rating = Rating.find(params[:rating_id])
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def update
    @rating = Rating.find(params[:rating_id])
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:alert] = "You updated that!"
      redirect_to rating_path(@recipe.rating)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to rating_path(@recipe.rating)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :search)
  end

end
