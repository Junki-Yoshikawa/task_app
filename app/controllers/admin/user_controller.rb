class Admin::UserController < ApplicationController
  before_action :admin_authenticate_user!
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_q, only: %i[ index ]

  def index
    @results = @q.result(distinct: true).includes(:tasks).order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params_create)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_index_url, notice: ta_t("notice.new") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params_update)
        format.html { redirect_to admin_user_index_url, notice: ta_t("notice.edit") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    # 管理者ユーザーは2人以上必要
    if User.where.not(id: [current_user.id, @user.id]).where(is_admin: true).size < 1
      respond_to do |format|
        format.html { redirect_to admin_user_index_url, alert: ta_t("alert.destroy") }
      end
    else
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_user_index_url, notice: ta_t("notice.destroy") }
      end
    end
  end

  private 
    def set_user
      @user = User.find(params[:id])
    end

    def set_q
      @q = User.ransack(params[:q])
    end

    def user_params_create
      params.require(:user).permit(:name, :email, :password, :password_confirm, :is_admin)
    end

    def user_params_update
      params.require(:user).permit(:name, :email)
    end

    def admin_authenticate_user!
      authenticate_user!
      unless current_user.is_admin
        redirect_to task_index_url
      end
    end
end
