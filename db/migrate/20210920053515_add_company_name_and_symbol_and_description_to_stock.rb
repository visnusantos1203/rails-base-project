class AddCompanyNameAndSymbolAndDescriptionToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :company_name, :string
    add_column :stocks, :symbol, :string
    add_column :stocks, :description, :string
  end
end
