class CreateCosmeticData < ActiveRecord::Migration[5.2]
  def change
    create_table :cosmetic_data do |t|
      t.string :name
      t.string :cosmetic_image

      t.timestamps
    end
  end
end
