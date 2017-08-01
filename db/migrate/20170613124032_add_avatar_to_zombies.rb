class AddAvatarToZombies < ActiveRecord::Migration[5.0]
  def change
    add_column :zombies, :avatar, :string
  end
end
