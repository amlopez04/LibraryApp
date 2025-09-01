class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.order(:name)
  end

  def show; end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(@author), notice: "Author created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to author_path(@author), notice: "Author updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    redirect_to authors_path, notice: "Author deleted!", status: :see_other
  end
end

  private
  def set_author; @author = Author.find(params[:id]); end
  def author_params; params.fetch(:author, {}).permit(:name, :email); end

