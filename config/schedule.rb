set :environment, "development"
set :output, "log/cron.log"
# every 1.day, at: '6:03 pm' do
every 1.minute do
  rake "fetch_historical_prices:update_historical_prices"
end
