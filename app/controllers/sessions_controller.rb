class SessionsController < ApplicationController 
    
    def new
        
    end 
    
    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
           session[:user_id] = user.id
           flash[:sucess] = "You have been logged in"
           redirect_to user_path(user)
        else
            flash.now[:danger] = "Your username or email adress is incorect"
            render 'new'
        end
    end 
    
    
    def destroy 
        if session[:user_id]
            session[:user_id] = nil
            flash[:success] = "You have been logged out"
            redirect_to root_path
        else
            flash[:danger] = "You are not logged in"
            redirect_to root_path
        end
    end 
    
end 