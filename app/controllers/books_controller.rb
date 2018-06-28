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
      redirect_to books_path, notice: 'The book successfully created.'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: 'The book successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'The book was deleted.'
  end

  def add
    
  end

  def add_author
    @book = Book.find(params[:book_id])
    lookup = params[:id]
    author = Author.find(lookup)
    @book.authors.push(author)    
    redirect_to books_path
  end

  def delete_author_form
    @book = Book.find(params[:book_id])
  end

  def delete_author
    @book = Book.find(params[:book_id])
    lookup = params[:id]
    author = Author.find(lookup)
    @book.authors.delete(author)    
    redirect_to books_path
  end
  
  private

  def load_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :category_id)
  end
end
