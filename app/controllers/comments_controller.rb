class CommentsController < ApplicationController
  
  before_action  :find_comment, only: [:show, :edit, :update, :destroy]
  
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new( comment_params )
    if @comment.save
      redirect_to comment_path( @comment ), notice: "Comment Created."
    else
      flash[ :alert ] = "See errors below:"
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @comment.update comment_params
      redirect_to comment_path( @comment )
    else
      render :edit
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to comments_path
  end
  
private
  
  def find_comment
    @comment = Comment.find params[:id]
  end
  
  def comment_params
    params.require( :comment ).permit( :made_by, :body )  
  end
end