class KidsController < ApplicationController

    def index
        @kids = current_user.kids.all
    end 

    def show
        @kid = Kid.find(params[:id])
    end 
    
    def new
        @kid = Kid.new
    end 

    def create
        # byebug
        @kid = Kid.new(kid_params)
        if @kid.save
            redirect_to @kid
        else
            render :new
        end 
        
    end 

    private

        def kid_params
            params.require(:kid).permit(:name, :birthday)
        end 
end
