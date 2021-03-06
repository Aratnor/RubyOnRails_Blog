
class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    if (params[:search])
      @articles = Article.search(params[:search])
    else
      @articles = Article.all
    end
  end

  def new
    @article = Article.new
  end 

  def edit
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = current_user
    #@article.save
    if @article.save
      flash[:success] = "Article saved!"
      redirect_to articles_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article updated"
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @comments =@article.comments
  end

  def destroy
    @article.destroy
    flash[:danger] =" Article deleted"
    redirect_to articles_path(@article)    
  end

  private
  def article_params
    params.require(:article).permit(:search,:title, :description, category_ids: [])
  end
  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user

  if (current_user != @article.user and !current_user.admin?)
    flash[:danger] = "You must log in "
    redirect_to root_path 
  end
  end
end