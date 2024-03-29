class SuccessesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_success, only: [:show, :edit, :update, :destroy]
  before_action :move_to_top_page, only: [:edit, :update, :destroy]

  def create
    @success = Success.new(success_params)
    if @success.save
      redirect_to root_path
    else
      render "users/edit"
    end
  end

  def show
    @like = Like.new
  end

  def edit
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def update
    if @success.update(success_params)
      redirect_to root_path
    else
      render :edit
    end    
  end

  def destroy
    if @success.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def success_params
    params.require(:success).permit(:title, :text).merge(user_id: params[:user_id])
  end

  def set_success
    @success = Success.find(params[:id]) 
  end

  def move_to_top_page
    unless current_user.id == @success.user_id
      redirect_to root_path
    end
  end  

end
