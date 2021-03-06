class ArticlesController < ApplicationController 
    
    before_action :set_article , only: [:edit,:update ,:show , :destroy]
    before_action :require_user, except:[:index,:show]
    before_action :require_same_user, only: [:edit, :update]
    
    def new 
        
        @article = Article.new
        
    end
    
    def index 
        
        @articles = Article.paginate( page: params[:page] , per_page: 5)
        
    end
    
    def edit 
       
        
    end 
    
    def update 
    
        if @article.update(article_params) 
            flash[:success] = "Your Article has been updated"
            redirect_to article_path(@article)
        else
            render :edit
        end     
        
    end
    
    def create
        
        @article = Article.new(article_params)
        @article.user = User.first
        #@article.save
        #redirect_to article_path(@article)
        
        if @article.save 
            flash[:success] = "Your Article has been saved"
            redirect_to article_path(@article)
        else
            render :new
        end 
    end 
    
    def show 
        
            
    end 
    
    
    def destroy
        @article.destroy
        flash[:danger] = "Your Article was successfully deleted"
        redirect_to articles_path
    end 
    
    private
    
    def set_article
        @article = Article.find(params[:id])
    end 
    
    def article_params
        params.require(:article).permit(:title,:description)
    end 
    
    def require_same_user
       if current_user != @article.user
            flash[:danger] = "You can only edit or update your own article"
            redirect_to root_path
       end 
    end
    
end
