class AddUserInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string
    add_column :users, :name, :string, default: '名無し', null: false
    add_column :users, :introduction, :text
  end
end
