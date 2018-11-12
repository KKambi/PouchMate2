class AddInfoidToCosmetics < ActiveRecord::Migration[5.2]
  def change
    add_column :cosmetics, :info_id, :integer
    add_column :cosmetics, :carousel_id, :integer
  end
end
