class MoviesController < ApplicationController

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.paginate(page: params[:page], per_page: 10)

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
    @reviewer = Reviewer.where(user: current_user, movie: @movie).first_or_create
    respond_to do |format|
      if @reviewer.update(rating_point: params[:rating_point])
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
    @reviewer = Reviewer.where(user: current_user, movie: @movie).first_or_initialize
    unless @reviewer.persisted?
      @reviewer.rating_point =  0
      @reviewer.save!(validate: false)
    end
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

  def reply_comment
    @movie = Movie.find(params[:id])
    @parent_commenter = Commenter.find(params[:parent_comment_id])
    @commenter = Commenter.new(user: current_user, parent_id: @parent_commenter.id, comment: params[:comment])
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
