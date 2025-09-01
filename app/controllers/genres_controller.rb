class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.order(:name)
  end

  def show; end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genre_path(@genre), notice: "Genre created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @genre.update(genre_params)
      redirect_to genre_path(@genre), notice: "Genre updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to genres_path, notice: "Genre deleted!", status: :see_other
  end
end

  private
  def set_genre; @genre = Genre.find(params[:id]); end
  def genre_params; params.fetch(:genre, {}).permit(:name); end

