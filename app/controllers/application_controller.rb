class ApplicationController < ActionController::Base
    # before_action :authorize

    # def authorize 
    #     render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :bettor_id
    # end
end
