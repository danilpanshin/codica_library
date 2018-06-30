class AuthorsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_author, only: %i[show update destroy edit]
  load_and_authorize_resource
  
  def index
    @authors = Author.all
  end

  def show
    
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)    
    if @author.save
      redirect_to authors_path, notice: 'The author successfully created.'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @author.update(author_params)
      redirect_to authors_path, notice: 'The author updated.'
    else
      render :new
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path, notice: 'The author deleted.'
  end
  
  private

  def load_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
