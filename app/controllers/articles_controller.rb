class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    #@article.save
    if @article.save
      flash[:success] = "Article saved!"
      redirect_to articles_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article updated"
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] =" Article deleted"
    redirect_to articles_path(@article)    
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end