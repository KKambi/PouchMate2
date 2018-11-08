class AddColsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :boolean
    add_column :users, :admin, :boolean, default: false
    add_column :users, :self_intro, :string
    add_column :users, :profile_img, :string
  end
end
