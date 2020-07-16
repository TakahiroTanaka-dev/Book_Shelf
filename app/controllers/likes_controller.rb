class LikesController < ApplicationController
  def create
    @like=current_user.likes.create(user_id: params[:user_id], book_id: params[:book_id])
    redirect_to books_path
  end

  def destroy
    @like=Like.find_by(book_id: params[:book_id], user_id: current_user.id)
    @like.destroy
    redirect_to books_path
  end

end
