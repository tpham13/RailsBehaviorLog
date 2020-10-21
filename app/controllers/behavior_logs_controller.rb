class BehaviorLogsController < ApplicationController
    before_action :set_kid_if_nested
    

    def new
        if @kid && !Kid.exists?(params[:kid_id])
            @behavior_log = @kid.behavior_logs.build
        else  
            @behavior_log = current_user.behavior_logs.build 
        end 
    end 

    def create
        @behavior_log = current_user.behavior_logs.build(behavior_log_params)
        if @behavior_log.save
            redirect_to behavior_log_path(@behavior_log)
        else
            render 'behavior_logs/new'  
        end 
    end 

    def edit
        @behavior_log = BehaviorLog.find_by_id(params[:id])
        redirect_to behavior_log_path if @behavior_log.user != current_user
    end 

    def update
        @behavior_log = BehaviorLog.find_by_id(params[:id])
        redirect_to behavior_logs_path if @behavior_log.user != current_user
        
        if @behavior_log.update(behavior_log_params)
            redirect_to behavior_log_path(@behavior_log)
        else
            render 'behavior_log/edit'
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

    def destroy
        #byebug
        @behavior_log = BehaviorLog.find_by_id(params[:id])
        
        @behavior_log.delete
        
        redirect_to user_path(@behavior_log)
    end 
    private

        def behavior_log_params
            params.require(:behavior_log).permit(:date, :time, :location, :before_behavior, :behavior_content, :outcome, :kid_id)
        end 

        def set_kid_if_nested
            @kid = Kid.find_by_id(params[:kid_id]) if params[:kid_id]
        end 

end
