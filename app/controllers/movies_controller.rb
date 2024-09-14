class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  # Sort Movie DB by sort_column and sort_direction upon GET
  def index
    @sort_column = sort_column
    @sort_direction = sort_direction
    @movies = Movie.order(@sort_column + ' ' + @sort_direction)
    
    # Record column and direction to session, so that we can recover later
    # @sort_direction gives the link to the sort direction
    # So the current direction to restore is the opposite of @sort_direction
    session[:sort] = @sort_column
    session[:direction] = @sort_direction == 'asc' ? 'desc' : 'asc'
    
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created" }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end

    # Check for sort column, with title as default
    def sort_column
      if Movie.column_names.include?(params[:sort])
        params[:sort]
      elsif Movie.column_names.include?(session[:sort])
        session[:sort]
      else
        "title"
      end
    end
    
    # Check params for sort direction, with asc as default
    def sort_direction
      if ['asc','desc'].include?(params[:direction]) 
        params[:direction]
      elsif ['asc', 'desc'].include?(session[:direction])
        session[:direction]
      else
        "asc"
      end
    end
end
