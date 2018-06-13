class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_admin, except: [:show, :edit, :update]
  before_action :require_permission

  def index
    @users = User.all
  end

  def show
    respond_to do |format|
      if @user
        format.html { render :show }
        format.json { render :show, status: :ok, location: @user }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_password

  end

  private



  def require_permission
    unless current_user.admin? || current_user == User.find(params[:id])
      raise ActiveRecord::RecordNotFound
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :about, :contact_phone, :password, :password_confirmation)
  end

end
