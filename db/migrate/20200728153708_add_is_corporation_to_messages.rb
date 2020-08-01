class AddIsCorporationToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :is_corporation, :boolean, default: true
  end
end
