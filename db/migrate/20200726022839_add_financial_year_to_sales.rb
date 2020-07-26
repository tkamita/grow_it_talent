class AddFinancialYearToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :financial_year, :string, null: false, default: ""
  end
end
