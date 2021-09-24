module HomeHelper
  def symbol_for_forex(rates)
    fx_hash = {}
    rates.each do |rate|
      fx_hash[rate.symbol] = rate.rate
    end
    fx_hash # lolz idk why it worked hahahahhasdasdhfasfd
  end
end
