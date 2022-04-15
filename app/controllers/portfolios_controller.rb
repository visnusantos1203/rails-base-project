class PortfoliosController < ApplicationController
  before_action :authenticate_user!

  def index
    @payments = Payment.all.where(user_id: current_user.id)
  end

  def show
    @payment = Payment.find_by(params[:id])
  end
end
