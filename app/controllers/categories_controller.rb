class CategoriesController < ApplicationController

    def index
        categories = Categories.all
        render json: categories
    end

    def show
        render json: @categories
    end
end
