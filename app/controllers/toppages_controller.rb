class ToppagesController < ApplicationController
  
  def index
    if logged_in?
      @tasks = current_user.tasks.order('created_at DESC')
      @task = current_user.tasks.build
    end
  end
end
