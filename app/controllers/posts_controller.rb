class PostsController < ApplicationController
  def index
  	@posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
    @coments = Coment.new(:post => @post)
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    if(@post.save)
      redirect_to posts_path, :notice => "New post has been created"
    else
    render "new"
    end  
  end
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if(@post.update_attributes(post_params))
      redirect_to posts_path, :notice=>"Your post has been update" 
    else 
      render "edit"
    end
      
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end  
end
