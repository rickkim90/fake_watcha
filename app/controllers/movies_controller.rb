class MoviesController < ApplicationController
  load_and_authorize_resource
  before_action :set_movie, only: [:show, :edit, :update, :destroy]  
  # before_action :check_admin, only: [:edit, :update, :destroy]
  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
    @movies = Movie.order(:id).page params[:page]
    #authorize! :read, Movie
  end

  # GET /movies/1
  # GET /movies/1.json
  # def show
  #   @sum = 0
  #   @sum = @sum.find(params[:id])
  #   @sum.each do |i|
  #     sum += i.rating
  #   end
  #   @avg
  # end
  def show
  #   total = 0
  #   @movie.reviews.each do |review|
  #     total += review.rating
  #   end
  #   if @movie.reviews.count == 0
  #     @avg = 0
  #   else
  #     @avg = total.to_f / @movie.reviews.count
  #   end
  # authorize! :read, Movie
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  #  authorize! :create, Movie
  end

  # GET /movies/1/edit
  def edit
  #  authorize! :update, Movie
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  #  authorize! :create, Movie
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  #  authorize! :update, Movie
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy if current_user.admin?
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  #  authorize! :destroy, Movie
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :desc, :photo_url)
    end
end
