class AddApellidoToOwner < ActiveRecord::Migration[5.0]
  def change
    add_column :owners, :apellido, :string
  end
end
