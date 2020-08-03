class SessionsController < ApplicationController
  include ActionController::Cookies

    def profile
      binding.pry
      render json: {user: @user}
    end 
    
    def create
        @user = User
            .find_by(name: params["user"]["name"])
            .authenticate(params["user"]["password"])
        if @user
          session[:user_id] = @user.id
          session[:user_id].freeze
          cookies[:user_id] = @user.id
          token = encode_token({ user_id: @user.id })
          render json: {user: @user, jwt: token}
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

    def encode_token(payload)
      # should store secret in env variable
      JWT.encode(payload, 'my_s3cr3t')
    end

end
    
    