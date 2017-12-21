class UsersController < ApplicationController
  before_action :all_users, only: :index

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = user_params[:email]
    @user.po_code = user_params[:po_code]
    @user.mob_number = user_params[:mob_number]
    @user.first_name = user_params[:first_name]
    @user.last_name = user_params[:last_name]
    @user.amount_bracket = user_params[:amount_bracket].to_i
    @user.cause = user_params[:cause].to_i
    @user.own_emotion = user_params[:own_emotion].to_i
    @user.other_emotion = user_params[:other_emotion].to_i
    @user.preferred_mean = user_params[:preferred_mean].to_i
    @user.money_wish = user_params[:money_wish]
    @user.age_bracket = user_params[:age_bracket].to_i
    @user.main_mobility_mode = user_params[:main_mobility_mode].to_i
    @user.motor_vehicle_owner = user_params[:motor_vehicle_owner]
    if @user.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :partial => 'users/form' }
        format.js
      end
    end
  end

  private

  def all_users
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:email, :po_code, :mob_number, :first_name,
      :last_name, :amount_bracket, :cause, :own_emotion, :other_emotion,
      :preferred_mean, :money_wish, :age_bracket, :main_mobility_mode, :motor_vehicle_owner)
  end
end
