class CreateCosmeticInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :cosmetic_infos do |t|
      t.string :name
      t.string :info_img

      t.timestamps
    end
  end
end
