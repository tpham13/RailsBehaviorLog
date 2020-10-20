class BehaviorLogsController < ApplicationController
    def index
    end 

    def show
        if params(:kid_id)
            @kid = Kid.find_by(id: params[:kid_id])
            @behavior_log = @kid.behavior_logs.find_by(id: params[:id])
            if @behavior_log.nil?
                redirect_to kid_behavior_logs_path(@kid)
            end 
        else 
            @behavior_log = BehaviorLog.find(params[:id])
        end 
    end 

    def new
        @behavior_log = BehaviorLog.new
    end 

    def create
        #  byebug
        @behavior_log = current_user.behavior_logs.build(behavior_log_params)
        # byebug
        if @behavior_log.save
            
            redirect_to behavior_log_path(@behavior_log)
        else
            # byebug
            render :new  
        end 
    end 

    private

        def behavior_log_params
            params.require(:behavior_log).permit(:date, :time, :location, :before_behavior, :behavior_content, :outcome, :kid_id, :user_id)
        end 


end
