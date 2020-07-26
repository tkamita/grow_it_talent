class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :corporation_id, null: false
      t.integer :year_sales, null:false, default: 0

      t.timestamps
    end
  end
end
