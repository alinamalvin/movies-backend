class SessionsController < ApplicationController
  include ActionController::Cookies

    def profile
      user_id = cookies[:user_id]
      @current_user = User.find_by(id: user_id)
      if @current_user.present? && @current_user.is_a?(User)
        render json: {user: @current_user}
      else
        render json: {message: 'Bad user'}, status: 401
      end
    end 
    
    def create
        @user = User
            .find_by(name: params["user"]["name"])
            .authenticate(params["user"]["password"])
        if @user
          session[:user_id] = @user.id
          cookies[:user_id] = @user.id
          token = encode_token({ user_id: @user.id })
          render json: {user: @user, jwt: token}
        else
          render json: { status: 401 }
        end
      end

    def destroy
        session.clear 
        @delete_cookies={}
        cookies.delete
        redirect_to '/'
    end 

    private 
    
    def user_params 
        params.require(:user).permit(:name, :password, :user_id)
    end 

    def encode_token(payload)
      # should store secret in env variable
      JWT.encode(payload, 'my_s3cr3t')
    end

    def find_user
      user_id = cookies[:user_id]
      @current_user = User.find_by(id: user_id)
  end
end
    
    