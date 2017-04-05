class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def edit
  end

  def new
  	@category =Category.new
  end

  def update
  	@category =Category.find(params[:id])
  	if(@category.update_attributes(category_params))
  		redirect_to categories_path, :notice=>"New category has added"
  	else
  		render "new"
  	end  			
  end

  def show
  	@category = Category.find(params[:id])
  	@posts = @category.posts
  	@title = @category.name
  end

  private
  def category_params
  	params.require(:category).permit(:name)
  end	
end
