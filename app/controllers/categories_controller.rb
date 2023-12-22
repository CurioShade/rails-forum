class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end
    def create
        @category = Category.new(category_params)
        if @category.save
            respond_to do |format|
                format.html { redirect_to root_url }
                format.turbo_stream
            end
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    private
    def category_params
        params.require(:category).permit(:name)
    end
end
