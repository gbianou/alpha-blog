class ArticlesController < ApplicationController 
    
    before_action :set_article , only: [:edit,:update ,:show , :destroy]
    
    def new 
        
        @article = Article.new
        
    end
    
    def index 
        
        @articles = Article.all
        
    end
    
    def edit 
       
        
    end 
    
    def update 
    
        
      
 
        if @article.update(article_params) 
            flash[:notice] = "Your Article has been updated"
            redirect_to article_path(@article)
        else
            render :edit
        end     
        
    end
    
    def create
        
        @article = Article.new(article_params)
        #@article.save
        #redirect_to article_path(@article)
        
        if @article.save 
            flash[:notice] = "Your Article has been saved"
            redirect_to article_path(@article)
        else
            render :new
        end 
    end 
    
    def show 
        
            
    end 
    
    
    def destroy
        @article.destroy
        flash[:notice] = "Your Article was successfully deleted"
        redirect_to articlescd _path
    end 
    
    private
    
    def set_article
        @article = Article.find(params[:id])
    end 
    def article_params
        params.require(:article).permit(:title,:description)
    end 
    
end
