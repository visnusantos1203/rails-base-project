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
        transactions = Payment.asc_transaction_type
      elsif sort == "amount"
        transactions =Payment.desc_amount
      elsif sort == "date"
        transactions =Payment.asc_time_placed
      else
        transactions = Payment.all
      end
    end
  end
end
