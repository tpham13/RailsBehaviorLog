class BehaviorLogsController < ApplicationController
    before_action :set_kid_if_nested, only: [:new, :index]
    

    def new
        if @kid
            @behavior_log = @kid.behavior_logs.build
        else  
            @behavior_log = current_user.behavior_logs.build 
        end 
    end 

    def create
        @behavior_log = current_user.behavior_logs.build(behavior_log_params)
        if @behavior_log.save
            redirect_to behavior_logs_path
        else
            render 'behavior_logs/new'  
        end 
    end 

    def index
        if @kid
            @behavior_logs = @kid.behavior_logs
        else
            @behavior_logs = BehaviorLog.all 
        end 
    end 

    def show
        @behavior_log = BehaviorLog.find_by(params[:id])
        # if params(:kid_id)
        #     @kid = Kid.find_by(id: params[:kid_id])
        #     @behavior_log = @kid.behavior_logs.find_by(id: params[:id])
        #     if @behavior_log.nil?
        #         redirect_to kid_behavior_logs_path(@kid)
        #     end 
        # else 
        #     @behavior_log = BehaviorLog.find(params[:id])
        # end 
    end 

    private

        def behavior_log_params
            params.require(:behavior_log).permit(:date, :time, :location, :before_behavior, :behavior_content, :outcome, :kid_id)
        end 

        def set_kid_if_nested
            @kid = Kid.find_by_id(params[:kid_id]) if params[:kid_id]
        end 

end
