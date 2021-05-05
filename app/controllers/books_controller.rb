class BooksController < ApplicationController
  def index
    @lists = Book.all
    @list = Book.new
  end

  def show
    @list = Book.find(params[:id])
  end

  def new
    @list = Book.all
  end

  def create
    list = Book.new(book_params)
    if list.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(list.id)
    else
      render :index
    end
  end

  def edit
    @list = Book.find(params[:id])
  end

  def update
    list = Book.find(params[:id])
    if list.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(list.id)
    end
  end

  def destroy
    list = Book.find(params[:id])
    list.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
