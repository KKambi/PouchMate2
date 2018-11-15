class CreateCarouselBackgrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :carousel_backgrounds do |t|
      t.string :name
      t.string :img_address

      t.timestamps
    end
  end
end
