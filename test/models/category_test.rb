require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
	def setup 
		@category = Category.new(name: "sport");
	end
	test "Category must be valid" do
		assert @category.valid?
	end
	test "Category name must be presince" do
		@category.name = " "
		assert_not @category.valid?
	end
	test "Category name must be unique" do
		@category.save
		category1= Category.new(name: "sport")
		assert_not category1.valid?
	end
	test "Name should not be short" do
		@category.name = "a" 
		assert_not @category.valid?
	end
	test "Name should not be long" do
		@category.name = "a" * 26
		assert_not @category.valid?
	end
end