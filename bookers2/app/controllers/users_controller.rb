class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.book
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "Book was successfully created."
      redirect_to books_path
    else
      @book = book
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction)
  end
  
end
