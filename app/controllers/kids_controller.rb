class KidsController < ApplicationController

    
    def new
        @kid = Kid.new
    end 

    def create
        @kid = Kid.new(kid_params)
        if @kid.save
            redirect_to kids_path(@kids)
        else
            render 'kids/new'
        end 
        
    end 

    def index
        @kids = current_user.kids.all
    end 

    def show
        @kid = Kid.find_by_id(params[:id])
    end 

    private

        def kid_params
            params.require(:kid).permit(:name, :birthday)
        end 
end
