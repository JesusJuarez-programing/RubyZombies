class AddAdminToZombie < ActiveRecord::Migration[5.0]
  def change
    add_reference :zombies, :admin, foreign_key: true
  end
end
