class BehaviorLogsController < ApplicationController
    def index
    end 

    def show
    end 

    def new
        @behavior_log = BehaviorLog.new
    end 

    def create
        @behavior_log = current_user.kids.behavior_logs.new(behavior_log_params)
        byebug
        if @behavior_log.save
            
            redirect_to behavior_logs_path
        else
            render :new 
        end 
    end 

    private

        def behavior_log_params
            params.require(:behavior_log).permit(:date, :time, :location, :before_behavior, :behavior_content, :outcome)
        end 


end
