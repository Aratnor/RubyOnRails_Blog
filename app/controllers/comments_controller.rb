class CommentsController < ApplicationController
	def index

	end
  	def new
    	@comment = Comment.new
  	end 
  	def create
  		@comment = Comment.new(comment_params)
  		@comment.user_id= current_user.id
  		@comment.article_id = params[:article_id]
  		    if @comment.save
	     flash[:success] = "Comment saved!"
	     redirect_to article_path(params[:article_id])
	    	else
	      render '_new'
	  end
    end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end