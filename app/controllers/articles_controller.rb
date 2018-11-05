class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  #war der ursprüngliche admin bereich
  #before_action läuft der reihe nach ab, also initalisierugsreihenfolge beachten!
  before_action :set_article, only: [:edit, :update, :show, :destroy]  
  #übergibt set_article nur an edit,update,show,destroy
  before_action :require_user, except: [:index, :show]
  #bedingung: irgend ein user für alles außer show und index
  before_action :require_same_user, only: [:edit, :update, :destroy]
  #nur user mit der gleichen id haben die berechtigung zum löschen, editieren, updaten
  

    
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end
    
  def edit
  end
    
  def create
    @article = Article.new(article_params)
    @article.user = User.first
      if  @article.save
        flash[:success] ="Der Artikel wurde erfolgreich erstellt"
        redirect_to @article
    else
      render 'new'
    end
  end
    
  def show
  end
  
  def update
      if @article.update(article_params)
        flash[:success] ="Der Artikel wurde erfolgreich geupdated"
        redirect_to @article
      else
        render 'edit'
     end
  end
  
  def destroy
    @article.destroy
    flash[:danger] ="Der Artikel wurde erfolgreich gelöscht"
    redirect_to articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end  
  def set_article
    @article = Article.find(params[:id])
  end
  def require_same_user
    if current_user != @article.user
      flash[:danger] = "Sie können nur Ihre eigenen Artikel bearbeiten!"
      redirect_to root_path
    end
  end
  
end
