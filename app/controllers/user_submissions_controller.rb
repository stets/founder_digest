class UserSubmissionsController < ApplicationController

    def create
        puts "WHITELISTED PARAMS: #{user_submission_params}"
        # UserSubmission.create!(user_submission_params)
        # redirect_to root_path
    end

    # TODO: whitelist role radio button
    def user_submission_params
        params.require(:user_submission).permit(:first_name, :last_name, :email, :website, :text)
    end

end

# params = { authenticity_token: 'asf', user_submission: {first_name: 'asf'}}