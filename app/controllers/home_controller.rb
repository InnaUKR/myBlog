class HomeController < ApplicationController
  def index
  	@result=Post.search_everywhere(params[:query])
  end

end
