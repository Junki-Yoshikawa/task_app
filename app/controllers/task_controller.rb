class TaskController < ApplicationController
  before_action :authenticate_user!
  before_action :set_labels, only: %i[ index show new edit create update ]
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_q, only: %i[ index ]

  def index
    @results = @q.result(distinct: true).includes(:task_labels).order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @p = task_params

    # FIX ME: 
    # 空白が含まれているかつ文字列配列になっているので、空白は取り除いて、文字⇒数値に変換している
    # 出来ればparamsの段階で既に TaskLabelsモデルの配列になっているほうが良い
    task_labels = []
    @p[:task_labels].compact_blank.map{|n| n.to_i}.each do |id|
      task_labels.push(TaskLabel.new(label_id: id))
    end
    @p[:task_labels] = task_labels
    @task = Task.new(@p)

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

    def set_labels
      @labels = Label.where(user_id: current_user.id)
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def set_q
      # ログインユーザーのユーザーIDを検索条件に含む
      if params[:q] == nil
        params[:q] = {:user_id_eq => current_user.id}
      else
        params[:q][:user_id_eq] = current_user.id
      end
      @q = Task.ransack(params[:q])
    end

    def task_params
      params.require(:task).permit(:title, :description, :ended_at, :status, {task_labels: []})
    end
    
end
