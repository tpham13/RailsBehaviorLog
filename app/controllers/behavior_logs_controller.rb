class BehaviorLogsController < ApplicationController
    def index
    end 

    def show
    end 

    def new
        @behavior_log = BehaviorLog.new
    end 

    def create
        #  byebug
        @behavior_log = @kid.behavior_logs.build(behavior_log_params)
        # byebug
        if @behavior_log.save
            
            redirect_to behavior_log_path
        else
            render :new  
        end 
    end 

    private

        def behavior_log_params
            params.require(:behavior_log).permit(:date, :time, :location, :before_behavior, :behavior_content, :outcome, :user_id)
        end 


end
