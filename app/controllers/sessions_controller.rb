class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create, :is_logged_in?, :destroy]

    def create
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        # User is authenticated
        session[:user_id] = user.id
        redirect_to root_url, notice: 'Logged in successfully!'
      else
        # Authentication failed
        flash.now[:alert] = 'Invalid email or password'
        render 'new'
      end
    end

    def is_logged_in?
        @current_user = User.find(session[:user_id]) if session[:user_id]
        if @current_user
          render json: {
            logged_in: true,
            user: UserSerializer.new(@current_user)
          }
        else
          render json: {
            logged_in: false
          }
        end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: 'Logged out successfully!'
    end
    private
    def session_params
        params.permit(:email, :password)
    end
  end
  