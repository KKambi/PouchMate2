class AddCosmeticInfoIdToCosmetics < ActiveRecord::Migration[5.2]
  def change
    add_reference :cosmetics, :cosmetic_info, foreign_key: true
    add_reference :cosmetics, :carousel, foreign_key: true
  end
end
