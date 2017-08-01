class AddRottenToZombies < ActiveRecord::Migration[5.0]
  def change
    add_column :zombies, :rotten, :boolean
  end
end
