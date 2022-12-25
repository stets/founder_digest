class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :maybe_subscribe

  def index
    @project = current_user.default_project
    # projects that aren't ours and have the scope ready
    @other_projects = Project.except(@project).ready
  end


end
