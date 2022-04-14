module HomeHelper
  def symbol_for_forex(rates)
    fx_hash = {}
    rates.each do |rate|
      fx_hash[rate.symbol] = rate.rate
    end
    fx_hash 
  end

  def compute_equation(formula)
    total = formula.split("")
    new_eq = []
    total.each do |n|
      if n.to_i.class? == integer
        new_eq << n.to_i
      else
        new_eq << n
      end
      
    end

  end
end
