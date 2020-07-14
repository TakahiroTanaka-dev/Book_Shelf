class BooksController < ApplicationController

  before_action :move_to_index, except:[:index, :show]

  def index
    @books=Book.all
  end

  def new
    @book=Book.new
  end

  def create
    Book.create(book_params)
    redirect_to users_path
  end

  def show 
    @book=Book.find(params[:id])
  end

  def search
    @books=Book.search(params[:keyword]).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json
    end
    
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    book=Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  private

  def book_params
    params.require(:book).permit(:name, :author, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
