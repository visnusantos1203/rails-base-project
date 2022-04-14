module AdminsHelper

  def search(search, sort)
    if search
      begin
        transactions = Payment.find(search.to_i)
      rescue
        flash[:alert] = "Transaction not found"
        transactions = Payment.all
      end
    else
      if sort == "transaction type"
        transactions = Payment.order("transaction_type ASC")
      elsif sort == "amount"
        transactions =Payment.order("quantity * current_price DESC")
      elsif sort == "date"
        transactions =Payment.order("time_placed ASC")
      else
        transactions = Payment.all
      end
    end
  end
end
