class BooksController < ApplicationController

  def index
    @books=Book.all
  end

  def new
    @book=Book.new
  end

  def create
    Book.create(book_params)
    redirect_to books_path
  end

  def show 
    @book=Book.find(params[:id])
  end

  def search
    @books=Book.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
    
  end

  def edit
    @book=Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :text, :image)
  end
  
end
