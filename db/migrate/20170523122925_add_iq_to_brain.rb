class AddIqToBrain < ActiveRecord::Migration[5.0]
  def change
    add_column :brains, :iq, :int
  end
end
