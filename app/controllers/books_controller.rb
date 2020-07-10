class BooksController < ApplicationController

  def index
    @books=Book.all
  end

  def new
    @book=Book.new
  end

  def create
    if Book.create(book_params)
      flash[:notice]="投稿が完了しました"
      redirect_to books_path
    else
      flash.now[:alert]="投稿に失敗しました"
      render :index
    end
  end

  def show 
    @books=Book.all
    @book=Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :text, :image)
  end
  
end
