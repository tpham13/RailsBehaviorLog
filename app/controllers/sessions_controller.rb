class SessionsController < ApplicationController

    def destroy
        session.clear
        redirect_to root_path
        # byebug
    end 

    def create
    #    byebug
        #find the person 
        user = User.find_by(username: params[:user][:username])
        # user is found & authenticate
        if user && user.authenticate(params[:user][:password])
        # set the session so when they login, their data is save in a session while they're login
        session[:user_id] = user.id 
        # redirect_to "/users/#{user.id}" #this line is the same as: 
        redirect_to user_path(user) 
        else 
            #typically we re-render the page but we don't want to do that here b/c:
            #if the user hasn't sign up yet, we don't want them to go back to the page where the info is right and repopulate
            #use flash message here:
            flash[:message] = "Incorrect login info, please try again"
            render :new
        end 
    end 
    # we do not need to set def home and def new in this controller
    # because Rails auto know to take us to home and new without clarifying it
    # in this controller UNLESS we need to it to do something specific
   
end 