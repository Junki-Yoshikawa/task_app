class TaskController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @results = Task.order(created_at: :desc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    # TODO: ユーザーIDはセッションから取得する
    @task.user_id = 0

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_index_url, notice: "タスクを作成しました。" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_index_url, notice: "タスクを更新しました。" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to task_index_url, notice: "タスクを削除しました。" }
    end
  end

  private 
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :ended_at)
    end
    
end
