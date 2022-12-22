class StakeHolderUpdatesController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @stake_holder_update = StakeHolderUpdate.new
    end

    def create
        project = current_user.default_project
        project.stake_holder_updates.create!(stake_holder_update_params)
        redirect_to dashboard_path, notice: "Stakeholder Update created"
    end

    def show
        project = current_user.default_project
        @stake_holder_update = project.stake_holder_updates.find(params[:id])
    end


    private 

    def stake_holder_update_params
        params.require(:stake_holder_update).permit(:title, :content)
    end
end
  