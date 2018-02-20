require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	def setup
		@comment = Comment.new(comment: "This is comment",user_id: 1,article_id: 3)
	end
	
	test "Comment model should be defined" do
			assert	@comment.valid?
	end
	
	test "Comment cannot be empty" do
		@comment.comment = ""
		assert_not @comment.valid?
	end
	
	test "Comment cannot be too long" do
		@comment.comment = "a" * 5001
		assert_not @comment.valid?
	end
	test "userid cannot be blank" do
		@comment.user_id = ""
		assert_not @comment.valid?
	end
end