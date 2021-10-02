class AddLogoUrlToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :logo_url, :string
  end
end
