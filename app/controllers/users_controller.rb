class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
skip_before_action :authorize, only: [:create, :show, :index, :update]
before_action :set_user, only: [:show, :destroy]
  
    # GET /users
    def index
      @users = User.all
      render json: @users
    end
  
    # GET /users/1
    def show
        user = User.find_by(id: session[:user_id])
        if user
          render json: user
        else
          render json: { message: "User not authenticated" }, status: :unauthorized
        end
      end
  
    # POST /users
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end
      
  
    # DELETE /users/1
    def destroy
      @user.destroy
      head :no_content
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end


    def render_not_found_response
        render json: { error: "User not found" }, status: :not_found
      end

      def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
      end

  end
  