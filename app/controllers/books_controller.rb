class BooksController < ApplicationController
  before_action :load_book, only: %i[show update destroy edit]

  def index
    @books = Book.all
  end

  def show
    
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)    
    if @book.save
      redirect_to books_path, notice: 'Your book successfully created.'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: 'Your book successfully created.'
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book was deleted.'
  end

  # def add_author
  #   @book = Book.find(params[:book_id])
  # end
  
  private

  def load_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :category_id)
  end
end
