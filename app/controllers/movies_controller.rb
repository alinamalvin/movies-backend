class MoviesController < ApplicationController

before_action :set_account

    def index
       @movies = @account.movies
       render json: @movies
    end 

    def create
        @movie = @account.movies.new(movie_params)
        if @movie.save 
            render json: @movie 
        else
            render json: {error: 'Error creating account'}
        end
    end 

    def show
      @movies = Movie.find(params[:id)
      # @movies = @account.find_by(id: params[:id)
      render json: @movie
    end 

    def destroy
    
    end 

    def set_account
        @account = Account.find(params[:account_id])
    end 

    private 
    
    def movie_params
        params.require(:movie).permit(:name, :kind, :account_id)
    end 
end


