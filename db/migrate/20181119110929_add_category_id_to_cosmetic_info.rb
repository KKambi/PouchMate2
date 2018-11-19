class AddCategoryIdToCosmeticInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :cosmetic_infos, :category_id, :integer
  end
end
