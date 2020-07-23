class CreatePgLangs < ActiveRecord::Migration[5.2]
  def change
    create_table :pg_langs do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :pg_langs, :name
  end
end
