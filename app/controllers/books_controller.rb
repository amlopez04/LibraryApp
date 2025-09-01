class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :load_lookups, only: [:new, :create, :edit, :update]

  def index
    @books = Book.includes(:author, :genre).order(created_at: :desc)
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "Book created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book deleted!", status: :see_other
  end
end

  private
  def set_book; @book = Book.find(params[:id]); end
  def load_lookups
    @authors = Author.order(:name)
    @genres  = Genre.order(:name)
  end
  def book_params; params.fetch(:book, {}).permit(:title, :description, :author_id, :genre_id); end

