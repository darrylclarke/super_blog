class CommentsController < ApplicationController
  
  before_action :authenticate_user!, except: []
 
  def create
    @comment = Comment.new comment_params
    @post    = Post.find params[:post_id]
    @comment.post = @post
    @comment.user = current_user
    
    respond_to do |format|
      if @comment.save
        #
        # Email the post's owner
        #
        # byebug
        CommentsMailer.notify_post_owner( @comment ).deliver_later
        
        #
        # Do other stuff
        #
        comment_action = ActionController::Base.helpers.dom_id( @comment )
        format.html { redirect_to post_path( @post ), anchor: :comment_action, notice: "Comment Created."}
        format.js   { render }
      else
        format.html {
          flash[ :alert ] = "Comment wasn't created."
          render "/posts/show"  # QUESTION - why does this work?
          }
        format.js { render }
      end
    end
  end
    
  def destroy 
    @post = Post.find( params[:post_id])
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path( @post ), notice: "Comment Deleted."}
      format.js { render }
    end
    # TODO - Can I use the GUI to delete a comment made by someone else?
    # TODO - Can I delete a comment made by someone else if I type the proper URL?
  end
  
private
  
  def comment_params
    params.require( :comment ).permit( :body )  
  end
end