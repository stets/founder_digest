class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project!

    def update
        @project.update!(project_params)
        redirect_to dashboard_path
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
