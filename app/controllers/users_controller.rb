class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:show]
    
    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            #log user in
            session[:user_id] = @user.id
            #redirect to the show page (@user)
            redirect_to user_path(@user)
        else
            render 'users/new' 
        end 
    end 

    def show
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end 

    private 

        def user_params 
            params.require(:user).permit(:username, :email, :password)
        end 
end
