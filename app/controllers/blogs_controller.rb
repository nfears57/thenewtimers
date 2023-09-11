class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :update, :destroy]
  
    # GET /blogs
    def index
      @blogs = Blog.all
      render json: @blogs
    end
  
    # GET /blogs/1
    def show
      render json: @blog
    end
  
    # POST /blogs
    def create
      @blog = Blog.new(blog_params)
  
      if @blog.save
        render json: @blog, status: :created
      else
        render json: @blog.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /blogs/1
    def update
      if @blog.update(blog_params)
        render json: @blog
      else
        render json: @blog.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /blogs/1
    def destroy
      @blog.destroy
      head :no_content
    end
  
    private
  
    def set_blog
      @blog = Blog.find(params[:id])
    end
  
    def blog_params
      params.require(:blog).permit(:title, :content, :category_id, :user_id)
    end
  end
  