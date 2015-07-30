class MoviesController < ApplicationController

  def index
    @movie_duration_options = [["All", ""],["Under 90 minutes", "0:90"], ["Between 90 and 120 minutes", "90:120"], ["Over 120 minutes", "120:"]]
    @movies = Movie.all

    if params.has_key?(:search) and not params[:search].empty?
      @movies = @movies.search(params[:search])
    end

    if params.has_key?(:runtime_in_minutes) and not params[:runtime_in_minutes].empty?
      start_finish = params[:runtime_in_minutes].split(":")
      @movies = @movies.runtime_in_minutes(start_finish[0], start_finish[1])
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :remote_image_url, :description, :image
    )
  end

end
