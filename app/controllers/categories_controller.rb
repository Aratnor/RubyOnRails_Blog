class CategoriesController < ApplicationController
	before_action :require_admin,except: [:index,:show]
	def index
		@categories = Category.paginate(page: params[:page],per_page: 5)
	end

	def new
		@category = Category.new
	end

	def edit
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		flash[:danger]= "Category deleted"
		redirect_to categories_path(@category)
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "category succcesfully saved"
			redirect_to categories_path
		else
			render 'new'
		end
	end
	def show
		@articles = Category.find(params[:id]).articles
	end
	private
	def category_params
		params.require(:category).permit(:name)
	end
	def set_category
		@category = Category.find(params[:id])
	end
	def require_admin
		if !logged_in? || (logged_in? and !current_user.admin?)
			flash[:danger] ="Only admin can perform that action"
			redirect_to categories_path
		end
	end
end
