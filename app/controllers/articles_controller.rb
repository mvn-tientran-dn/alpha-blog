class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.page(params[:page])
                       .per(params[:per_page]).order('created_at DESC')
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(articles_params)
    @article.user = current_user
    
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(articles_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Article was successfully deleted"
    end

    redirect_to articles_path
  end

  private

    def articles_params
      params.require(:article).permit(:title, :description, category_ids: [])
    end

    def set_article
      @article = Article.friendly.find(params[:id])
    end

    def require_same_user
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to root_path
      end
    end

end
