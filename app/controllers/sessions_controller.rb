class SessionsController < ApplicationController

    def new
    end 
    
    def create
        @user = User
            .find_by(name: params["user"]["name"])
            .authenticate(params["user"]["password"])
        if @user
          session[:user_id] = @user.id
          render json: {user: @user}
        else
          render json: { status: 401 }
        end
      end
    
    def destroy
        session.clear 
        redirect_to '/'
    end 

    private 
    
    def user_params 
        params.require(:user).permit(:name, :password)
    end 

end
    
    