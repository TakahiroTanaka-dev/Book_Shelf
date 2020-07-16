class UsersController < ApplicationController
  def index
    @books=current_user.books.order("created_at DESC").page(params[:page])
  end

  

end
