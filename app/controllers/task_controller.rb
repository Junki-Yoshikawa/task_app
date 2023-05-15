class TaskController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_q, only: %i[ index ]

  def index
    @results = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    # TODO: ユーザーIDはセッションから取得する
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_index_url, notice: ta_t("notice.new") }
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
        format.html { redirect_to task_index_url, notice: ta_t("notice.edit") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to task_index_url, notice: ta_t("notice.destroy") }
    end
  end

  private 
    def set_task
      @task = Task.find(params[:id])
    end

    def set_q
      @q = Task.ransack(params[:q])
    end

    def task_params
      params.require(:task).permit(:title, :description, :ended_at, :status)
    end
    
end
