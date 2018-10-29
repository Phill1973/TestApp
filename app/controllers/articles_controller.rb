class ArticlesController < ApplicationController
  
  http_basic_authenticate_with name: "test", password: "12345", except: [:index, :show]
    
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
    @article = Article.new(article_params)
      if  @article.save
        flash[:success] ="Der Artikel wurde erfolgreich erstellt"
        redirect_to @article
    else
      render 'new'
    end
  end
    
  def show
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:success] ="Der Artikel wurde erfolgreich geupdated"
        redirect_to @article
      else
        render 'edit'
     end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] ="Der Artikel wurde erfolgreich gelöscht"
    redirect_to articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end
