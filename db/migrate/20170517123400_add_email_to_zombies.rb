class AddEmailToZombies < ActiveRecord::Migration[5.0]
  def change
    add_column :zombies, :email, :string
  end
end
