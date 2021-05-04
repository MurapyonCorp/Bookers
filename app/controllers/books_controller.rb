class BooksController < ApplicationController
  def index
    @lists = Book.all
    @list = Book.new
  end

  def show
  end

  def new
    @list = Book.all
  end

  def create
    list = Book.new(book_params)
    list.save
    redirect_to books_path
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
