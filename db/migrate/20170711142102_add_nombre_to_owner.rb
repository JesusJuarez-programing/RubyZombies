class AddNombreToOwner < ActiveRecord::Migration[5.0]
  def change
    add_column :owners, :nombre, :string
  end
end
