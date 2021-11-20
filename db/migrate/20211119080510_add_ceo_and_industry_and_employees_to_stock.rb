class AddCeoAndIndustryAndEmployeesToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :ceo, :string
    add_column :stocks, :industry, :string
    add_column :stocks, :employees, :integer
  end
end
