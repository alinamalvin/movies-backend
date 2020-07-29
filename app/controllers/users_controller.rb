class UsersController < ApplicationController 

    # GET /register = New User Action
    def new
        @user = User.new
        render plain: 'Sign Up Page'
    end

    # POST /users - Create the User Action
    def create
        @user = User.new(user_params)
        if @user.save
            @accounts = Account.all 
            render json: @accounts
        else 
            render json: {error: 'Error creating account'}
        end 
    end 

    private 
    
    def user_params 
        params.require(:user).permit(:name, :password_digest)
    end 

end