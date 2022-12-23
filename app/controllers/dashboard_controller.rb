class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flashes

  def index
    @project = current_user.default_project
    # projects that aren't ours and have the scope ready
    @other_projects = Project.except(@project).ready
  end

  private

  def set_flashes
    if params[:subscribed] == 'true'
      current_user.delay.set_stripe_subscription
      flash.now[:notice] = 'Your account is now active!'
    end
  end
end
