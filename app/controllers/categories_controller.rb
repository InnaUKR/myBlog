class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def edit
  end

  def new
  	@category =Category.new
  end

  def create
  	@category =Category.new(category_params)
  	if(@category.save)
  		redirect_to categories_path, :notice=>"New category has been added"
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
