class AddRolesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :roles, :text, array: true, default: ['user']
  end
end
