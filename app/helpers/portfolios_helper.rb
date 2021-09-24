module PortfoliosHelper
  def sorted_company_name(company)
    arr_of_company_names = company
    result = []
    arr_of_company_names.each_with_index { |x, i| result << x unless result.include?(x) || i.zero?  } # nagamit ko dito yung sagot sa isang coding challenge hehe
    result.sort
  end
end
