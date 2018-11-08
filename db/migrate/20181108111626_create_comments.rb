class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :writer_id
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
