class ArticlesController < ApplicationController 
    
    def new 
        
        @article = Article.new
        
    end
    
    def edit 
        @article = @article = Article.find(params[:id])
        
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
        @article = Article.find(params[:id])
            
    end 
    
    def update 
    
        @article = Article.find(params[:id])
 
        if @article.update(article_params) 
            flash[:notice] = "Your Article has been updated"
            redirect_to article_path(@article)
        else
            render :edit
        end     
        
    end
    
    private 
    def article_params
        params.require(:article).permit(:title,:description)
    end 
    
end
