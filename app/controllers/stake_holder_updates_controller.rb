class StakeHolderUpdatesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, except: [:new]
    before_action :set_stakeholder_update, except: [:new, :create]

    def new
        @stake_holder_update = StakeHolderUpdate.new
    end

    def create
        stakeholder_update = @project.stake_holder_updates.create!(stake_holder_update_params)
        redirect_to stake_holder_update_path(stakeholder_update), notice: "Stakeholder Update created"
    end
    
    def show
    end

    def update
        @stake_holder_update.update(stake_holder_update_params)
        redirect_to dashboard_path, notice: 'Stakeholder update will be shared soon!'
    end

    private

    def set_project
        @project = current_user.default_project
    end

    def set_stakeholder_update
        @stake_holder_update = @project.stake_holder_updates.find(params[:id])
    end

    def stake_holder_update_params
        params.require(:stake_holder_update).permit(:title, :content, :confirmed_at)
    end
end
  