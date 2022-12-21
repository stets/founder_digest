class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:start, :logout]
  

  def home
  end

  def apply
  end

  def start
    @project = current_user.default_project
    
    if (@project.title? && @project.description?)
      redirect_to dashboard_path, notice: "You've already created your project."
    end
  end

  def thanks
  end

  def magic_login
    # need template here or redirect
    user = User.find_by(auth_code: params[:auth_code])
    # sign in function came with devise and JUST DOES IT, noice!
    if user
      sign_in(user)
      redirect_to start_path
    else
      redirect_to user_session_path, alert: 'You need to sign in first'
    end
  end

  def logout
    sign_out(current_user)
    redirect_to root_path
  end

  def page
    @page_key = request.path[1..-1]
    render "pages/#{@page_key}"
  end
end
