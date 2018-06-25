class CategoriesController < ApplicationController
  before_action :load_category, only: %i[show update destroy edit]

  def index
    @categories = Category.all
  end

  def show
    
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)    
    if @category.save
      redirect_to categories_path, notice: 'Category successfully created.'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category updated.'
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category deleted.'
  end
  
  private

  def load_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
