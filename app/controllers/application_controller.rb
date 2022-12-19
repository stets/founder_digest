class ApplicationController < ActionController::Base
  # provided by devise
  # tells user where to go after sign in
  def after_sign_in_path_for(resource)
    start_path
    # insert logic to determine where user should go after sign in
    # resource.paying_customer? ? dashboard_index_path : subscribe_index_path # point these wherever you want
	end

  def maybe_skip_onboarding
    redirect_to dashboard_index_path, notice: "You're already subscribed" if current_user.finished_onboarding?
  end
end
