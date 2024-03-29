class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project!
    before_action :maybe_subscribe

    def update
        puts "project params"
        puts project_params
        @project.update!(project_params)
        if current_user.pro_plan?
            redirect_to subscribe_index_path
        else
            redirect_to dashboard_path
        end
    end

    private

    def set_project!
        @project = current_user.projects.find(params[:id])
        # use current user to find child objects of user
    end
    
    def project_params
        params.require(:project).permit(:title, :description)
    end

end
