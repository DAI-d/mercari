class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :profile_image, :string
    add_column :users, :phone_number, :integer, null: false
  end
end
