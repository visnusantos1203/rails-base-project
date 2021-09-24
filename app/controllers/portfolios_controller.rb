class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  # dito sana naka list lang lahat ng companies na may investment si user
  def index
    # @payments = Payment.where(user_id: current_user.id).order('ASC')
    @payments = Payment.all
    @companies = []
    @payments.each do |payment|
      company = Stock.find_by(id: payment.stock_id)
      @companies.push([company.company_name, payment.stock_id])
    end
    # @name = @payments.stock_id.company_name
  end

  # dito pwedeng ma view yung payments sa isang transaction
  def show
    @payment = Payment.find_by(params[:id])
  end
end
