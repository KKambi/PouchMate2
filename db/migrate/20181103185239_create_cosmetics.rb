class CreateCosmetics < ActiveRecord::Migration[5.2]
  def change
    create_table :cosmetics do |t|
      t.string :title
      t.string :memo
      t.string :category
      t.date :exp_date
      t.integer :user_id
      t.integer :carousel

      t.timestamps
    end
  end
end
