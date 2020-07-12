class MoviesController < ApplicationController

before_action :set_account

    def index
            @movies = Movie.all 
            render json: @movies
    end 

    def create
        @movie = @account.movies.new(movie_params)
        if @movie.save 
            render json: @account
        else
            render json: {error: 'Error creating account'}
        end
    end 

    def show
      @movies = Movie.find(params[:id])
      # @movies = @account.find_by(id: params[:id)
      render json: @movie
    end 

    def destroy
        @movie = Movie.find(params["id"])
        @account = Account.find(@movie.account_id)
        @movie.destroy
        render json: @account
    end 

    def set_account
        @account = Account.find(params[:account_id])
    end 

    private 
    
    def movie_params
        params.require(:movie).permit(:name, :kind, :account_id)
    end 
end


