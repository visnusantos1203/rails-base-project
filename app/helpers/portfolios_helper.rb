module PortfoliosHelper
  def sorted_company_name(company)
    arr_of_company_names = company
    result = []
    arr_of_company_names.each_with_index do |x, i| 
      if i.zero? 
        result << x 
      elsif result.include?(x) 
      else result << x  
      end # nagamit ko dito yung sagot sa isang coding challenge hehe
    end
    result.sort
  end
end
