class SessionsController < ApplicationController

    def destroy
        session.clear
        redirect_to root_path 
    end 

    def create
        if auth
            @user = User.find_or_create_by(email: auth["info"]["email"]) do |u| #if user is exist then find the user by email by the returned hash 
                #then we're going to set the user attributes: username and password
                u.username = auth["info"]["name"]
                u.password = SecureRandom.hex(10)
        end 
        #if the user is saved, then we'll set the session[:user_id] = @user.id
        if @user.persisted?
            session[:user_id] = @user.id
            redirect_to @user
        else
            #if user isn't saved then redirect_to root_path
            redirect_to '/'
        end 
        else
            #NORMAL LOGIN PROCESS W/ Bcrypt
            user = User.find_by(username: params[:user][:username])
            if user && user.authenticate(params[:user][:password])
                # set the session so when they login, their data is save in a session while they're login
                session[:user_id] = user.id 
                redirect_to user_path(user) 
            else 
                flash[:message] = "Incorrect login info, please try again"
                render :new
            end
        end

    end
    
   private

   def auth #this method response with a hash that we get from facebook
    request.env['omniauth.auth']
   end 
end 