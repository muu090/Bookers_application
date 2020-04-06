class BooksController < ApplicationController
  before_action :authenticate_user!, 
    only: [:new, :index, :show, :create, :edit, :update, :destroy]

    
def new
  @book = Book.new
end

def home
  @user = current_user
end

def about
  @user = current_user
end

def index
  @user = current_user
  @books = Book.all
  @book = Book.new
end

def show
  @book = Book.new
  @user = current_user
  @books = Book.find(params[:id])
end

def create
  @books = Book.all
  @book = Book.new(book_params)
  @user = current_user
  @book.user_id = current_user.id
  if @book.save
    redirect_to book_path(@book.id), notice: 'You have creatad book successfully.'
  else
    render :index, notice: 'error saved.'
  end
end

def edit
  @user = current_user
  @book = Book.find(params[:id])
  if @user.id != @book.user.id
    redirect_to books_path
  end
end

def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
  else
    render :edit, notice: 'error saved.'
  end
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
end

private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
