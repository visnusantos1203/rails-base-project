class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def dashboard
    @for_approvals = User.where(approved: false)
    @all_users = User.all
    @transactions = Payment.all
  end

  def approve_users;
    @user = User.find(params[:id])
    @user.approved = true
    @user.save
    if @user.save
      ConfirmationMailer.account_approval_email(@user.email).deliver_now
      redirect_back fallback_location: admins_dashboard_path
    else
      render :approve_users
    end
  end
  
  def all_transactions;
    @payments = Payment.all
  end

  def new_user;
    @new_user = User.new
  end

  def create_user;
    @create_user = User.new(params.require(:user).permit(:first_name, :last_name, :username, :email, :password))
    @create_user.approved = true

    if @create_user.save
      redirect_to admins_dashboard_path
    else
      redirect_back fallback_location: admins_dashboard_path
    end
  end

  def show_user;
    @user = User.find(params[:id])
  end

  def edit_user;
    @user = User.find(params[:id])
  end

  def update_user;
    @user = User.find(params[:id])
    @user.update(update_params)
    @user.save
    if @user.save
      redirect_back fallback_location: admins_dashboard_path
    else
      redirect_to :edit_user
    end

  end

  private

  def update_params
    params.require(:user).permit(:first_name, :last_name, :username, :email)
  end


end
