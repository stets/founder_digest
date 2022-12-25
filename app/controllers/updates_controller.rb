class UpdatesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_stakeholder_update

    
    def show
    end

    private
    def set_stakeholder_update
        # scope to current user or account if we can
        @stake_holder_update = StakeHolderUpdate.find_by(uuid: params[:id])
    end

    def stakeholder_update_params
        params.require(:stake_holder_update).permit(:title, :content, :confirmed_at)
    end
end
  