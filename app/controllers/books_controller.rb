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
    flash[:notice]="新しい本を追加しました"
    redirect_to users_path
  end

  def show 
    @book=Book.find(params[:id])
    @like=Like.new
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
    flash[:notice]="本の内容を編集しました"
    redirect_to book_path(book.id)
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    flash[:alert]="本を削除しました"
    redirect_to books_path
  end



  private

  def book_params
    params.require(:book).permit(:name, :author, :text, :image, :category_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
