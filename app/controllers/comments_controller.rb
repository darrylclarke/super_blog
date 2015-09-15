class CommentsController < ApplicationController
  
  before_action :authenticate_user!, except: []
 
  def create
    @comment = Comment.new comment_params
    @post    = Post.find params[:post_id]
    @comment.post = @post
    @comment.user = current_user
    
    if @comment.save
      comment_action = ActionController::Base.helpers.dom_id( @comment )
      redirect_to   post_path( @post ), 
                    anchor: :comment_action,
                    notice: "Comment Created."
    else
      flash[ :alert ] = "Comment wasn't created."
      render "/posts/show"  # QUESTION - why does this work?
    end
  end
    
  def destroy
    @post = Post.find( params[:post_id])
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to post_path( @post ), notice: "Comment Deleted."
    # TODO - Can I use the GUI to delete a comment made by someone else?
    # TODO - Can I delete a comment made by someone else if I type the proper URL?
  end
  
private
  
  def comment_params
    params.require( :comment ).permit( :body )  
  end
end