class UserSubmissionsController < ApplicationController

    def create
        UserSubmission.create!(user_submission_params)
        # todo: redirect to a thank you page
        redirect_to root_path, notice: 'Thanks, your application was received!'
    end

    def user_submission_params
        params.require(:user_submission).permit(:first_name, :last_name, :email, :website, :text, :job_role, :plan_name)
    end

end
