client = IEX::Api::Client.new(
    publishable_token: 'Tpk_01273dfe6905454eb34261aa36cd7198',
    secret_token: 'Tsk_c3bab9f09d4440539a75b1803a0f83a4',
    endpoint: 'https://sandbox.iexapis.com/v1'
  )
all_symbols = client.ref_data_symbols

Stock.destroy_all

500.times do |index|
  company_info = client.company(all_symbols[index].symbol)

  begin
    Stock.create(symbol: all_symbols[index].symbol, company_name: company_info.company_name, description: company_info.description)
  rescue  StandardError
    nil
  end
end