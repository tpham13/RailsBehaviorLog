class BehaviorLogsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @behavior_log = current_user.behavior_logs.build 
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
        @behavior_log = find_by_id
        redirect_to '/' if !@behavior_log || @behavior_log.user != current_user
    end 

    def update
        @behavior_log = find_by_id
        redirect_to behavior_logs_path if !@behavior_log || @behavior_log.user != current_user 
        if  @behavior_log.update(behavior_log_params)
            redirect_to behavior_log_path(@behavior_log)
        else
            render 'behavior_logs/edit'
        end 
    end 

    def index
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @behavior_logs = @user.behavior_logs
        else
            @error = "That user doesn't exist" if params[:user_id]
            @behavior_logs = BehaviorLog.all 
        end  
    end 

    def show
        @behavior_log = find_by_id
    end 

    def destroy
        @behavior_log = find_by_id
        if !@behavior_log || @behavior_log.user != current_user 
            redirect_to '/'
        else 
        @behavior_log.delete
            redirect_to user_path(current_user)
        
        end 
      
    end 
    
    private

        def behavior_log_params
            params.require(:behavior_log).permit(:time, :location, :before_behavior, :behavior_content, :outcome, :kid_id, :user_id)
            
        end 

        def find_by_id
            BehaviorLog.find_by(id: params[:id])
        end 

end
