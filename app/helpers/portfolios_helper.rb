module PortfoliosHelper

  def sorted_company_names(payments)
    sorted_company_names = []
    # Selects distinct stock ids from user's payment
    payments.distinct.pluck(:stock_id).each do |stock_id|
    # Queries the name of the company based on the distinct stock ids and then pushed into the company names array
      unless stock_id.nil?
        sorted_company_names << [Stock.find_by(id: stock_id).company_name, stock_id]
      end
    end
    # Sorts and returns an array of company names
    sorted_company_names.sort
  end

end
