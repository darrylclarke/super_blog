class PostsController < ApplicationController
  
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_post,          only:   [:show, :edit, :update, :destroy]
  before_action :authorize!,         only:   [:edit, :update, :destroy]
  
  def index
    if params[:filter] == "favourites"
      @posts = current_user.favourite_posts.order(:created_at)
    else
      @posts = Post.all.order(:created_at)
    end
  end

  def new
    @post = Post.new
  end

# TODO - Can I create a Post when not logged in?
  def create
    @post = Post.new( post_params )
    @post.user = current_user
    
    if @post.save
      redirect_to post_path( @post ), notice: "Post Created."
    else
      flash[ :alert ] = "See errors below:"
      render :new
    end
  end
  
  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path( @post )
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path(@post)
  end
  
  def authorize!
    redirect_to root_path, message: "Access Denied." unless can? :manage, @post
  end
  
private
  
  def find_post
    @post = Post.find params[:id]
  end
  
  def post_params
    params.require( :post ).permit( :title, :body, :category_id, {tag_ids: []} )  
  end
end