class BooksController < ApplicationController
  
  def new
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      @books = Book.all
      render :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end  
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      @book = book
      render :index
    end
  end
  
  def destroy
    flash[:notice] = "Book was successfully created."
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
