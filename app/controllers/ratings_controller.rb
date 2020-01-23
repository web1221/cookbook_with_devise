class RatingsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @ratings = Rating.all
    render :index
  end

  def new
    @rating = Rating.new
    render :new
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to ratings_path
    else
      render :new
    end

  end

  def edit
    @rating = Rating.find(params[:id])
    render :edit
  end

  def show
    @rating = Rating.find(params[:id])
    if params[:search]
      @recipes = @rating.recipes.search(params[:search])
    else
      @recipes = @rating.recipes
    end
    render :show
  end

  def update
    @rating= Rating.find(params[:id])
    if @rating.update(rating_params)
      redirect_to ratings_path
    else
      render :edit
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to ratings_path
  end

  private
  def rating_params
    params.require(:rating).permit(:difficulty)
  end
end
