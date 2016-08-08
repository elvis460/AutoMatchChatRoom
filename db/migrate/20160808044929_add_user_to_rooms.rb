class AddUserToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :user_1, :string
    add_column :rooms, :user_2, :string
  end
end
