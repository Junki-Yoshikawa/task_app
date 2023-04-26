class TaskController < ApplicationController
  def index
    @results = Task.all
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
        format.html { redirect_to task_index_url, notice: "Task was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def task_params
    params.require(:task).permit(:title, :discriptions)
  end
    
end
