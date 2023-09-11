# app/controllers/comments_controller.rb

class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :destroy]
 
    def show
      render json: @comment
    end
  

    def create
      @comment = Comment.new(comment_params)
  
      if @comment.save
        render json: @comment, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    
    def destroy
      @comment.destroy
      head :no_content
    end
  
    private
  
    def set_comment
      @comment = Comment.find(params[:id])
    end
  
    def comment_params
      params.require(:comment).permit(:content, :user_id, :blog_id)
    end
  end
  