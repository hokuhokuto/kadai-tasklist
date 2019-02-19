class TasksController < ApplicationController
  before_action :set_task , only:[:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    @tasks = current_user.tasks.order('created_at DESC')
    
    if @task.save
      flash[:success] = 'Taskが正常に投稿されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'Taskが正常に投稿されませんでした'
      render "toppages/index"
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'Taskが正常に編集されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが正常に編集されませんでした'
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to root_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content,:status)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
end
