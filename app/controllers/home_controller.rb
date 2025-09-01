class HomeController < ApplicationController
  def index
    @books  = Book.includes(:author, :genre).order(created_at: :desc).limit(5)
    @counts = {
      authors: Author.count,
      genres:  Genre.count,
      books:   Book.count
    }
  end
end
