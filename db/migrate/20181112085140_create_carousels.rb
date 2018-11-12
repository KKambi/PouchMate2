class CreateCarousels < ActiveRecord::Migration[5.2]
  def change
    create_table :carousels do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :carousel_background, foreign_key: true

      t.timestamps
    end
  end
end
