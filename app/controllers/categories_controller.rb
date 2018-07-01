class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_category, only: %i[show update destroy edit]
  load_and_authorize_resource
  
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

  def add
    @category = Category.find(params[:category_id])
  end

  def add_book
    @category = Category.find(params[:category_id])
    book = Book.find(params[:title])
    @category.books.push(book)    
    redirect_to categories_path
  end

  def delete_book_form
    @category = Category.find(params[:category_id])
  end

  def delete_book
    @category = Category.find(params[:category_id])
    book = Book.find(params[:title])
    @category.books.delete(book)    
    redirect_to categories_path
  end
  
  private

  def load_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
