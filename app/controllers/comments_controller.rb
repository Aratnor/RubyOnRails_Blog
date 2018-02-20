class CommentsController < ApplicationController
	def index
		@comments = Article.find(params[:article_id]).comments
		@user = User.find(params[:user_id])
	end
  	def new
    	@comment = Comment.new
  	end 
  	def create
  		@comment = Comment.new(comment_params)
  		@comment_user = current_user
  		@article_id
  		    if @comment.save
	     flash[:success] = "Article saved!"
	     redirect_to articles_path(@article)
	    	else
	      render '_new'
	  end
    end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end