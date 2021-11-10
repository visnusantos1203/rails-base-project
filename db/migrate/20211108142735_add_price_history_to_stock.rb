class AddPriceHistoryToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :price_history, :string
  end
end
