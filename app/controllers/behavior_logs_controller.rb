class BehaviorLogsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:create, :new, :edit, :update]
    before_action :set_kid_if_nested, only: [:new, :index]

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
            redirect_to behavior_logs_path
        else
            render 'behavior_logs/new'  
        end 
    end 

    def edit
        @behavior_log = BehaviorLog.find_by(id: params[:id])
        redirect_to '/' if !@behavior_log || @behavior_log.user != current_user
    end 

    def update
        
        @behavior_log = BehaviorLog.find_by(id: params[:id])
        redirect_to behavior_logs_path if !@behavior_log || @behavior_log.user != current_user 
        if @behavior_log.update(behavior_log_params)
            redirect_to behavior_log_path(@behavior_log)
        else
            render 'behavior_logs/edit'
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
        # @behavior_log = BehaviorLog.find_by(id: params[:id])
        # if @kid
            @behavior_log = BehaviorLog.find_by(id: params[:id])
            # @behavior_log = @kid.behavior_logs.find_by(id: params[:id])
        #     if @behavior_log.nil?
        #         redirect_to kid_behavior_logs_path(@kid)
        #     end 
        # else 
        #     @behavior_log = BehaviorLog.find(params[:id])
        # end 
    end 

    def destroy
        
        BehaviorLog.find_by(id: params[:id]).delete
        # byebug
        redirect_to '/'
    end 
    private

        def behavior_log_params
            params.require(:behavior_log).permit(:date, :time, :location, :before_behavior, :behavior_content, :outcome, :kid_id, :user_id)
            
        end 

        def set_kid_if_nested
            @kid = Kid.find_by_id(params[:kid_id]) if params[:kid_id]
        end 

end
