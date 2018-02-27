class MoviesController < ApplicationController

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json { render json: @movies }
    end
  end

  # GET /movie/1
  # GET /movie/1.json
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  def import
    Movie.import(params[:file])

    redirect_to root_url, notice: 'Products imported.'
  end

  def add_review
    @movie = Movie.find(params[:id])
    @reviewer = @movie.reviewers.new(user: current_user, rating_point: params[:rating_point])
    respond_to do |format|
      if @reviewer.save
        format.html { redirect_to @movie, notice: 'Product was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "show" }
        format.json { render json: @reviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_comment
    @movie = Movie.find(params[:id])
    @commenter = @movie.commenters.new(user: current_user, comment: params[:comment])
    respond_to do |format|
      if @commenter.save
        format.html { redirect_to @movie, notice: 'Product was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "show" }
        format.json { render json: @commenter.errors, status: :unprocessable_entity }
      end
    end
  end
end
