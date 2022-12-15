class Admin::PagesController < ApplicationController
    before_action :authenticate_user!, only: [:logout]
  
    def terms
    end

    def dashboard 
    end
  end
  