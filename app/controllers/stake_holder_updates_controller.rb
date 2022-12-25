class StakeHolderUpdatesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, except: [:new]
    before_action :set_stakeholder_update, except: [:new, :create]
    before_action :maybe_subscribe

    
    def new
        @stake_holder_update = StakeHolderUpdate.new
    end

    def create
        stakeholder_update = @project.stake_holder_updates.create!(stake_holder_update_params)
        redirect_to stake_holder_update_path(stakeholder_update), notice: "Stakeholder Update created"
    end
    
    def show
    end

    def edit
    end

    def update
        # if we update
        @stake_holder_update.update(stake_holder_update_params)

        if @stake_holder_update.confirmed?
            redirect_to dashboard_path, notice: 'Stakeholder update will be shared soon!'
        else
            redirect_to stake_holder_update_path(@stake_holder_update), notice: "Stakeholder Update changes were saved!"
        end

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
  