class AddFreshToBrain < ActiveRecord::Migration[5.0]
  def change
    add_column :brains, :fresh, :boolean
  end
end
