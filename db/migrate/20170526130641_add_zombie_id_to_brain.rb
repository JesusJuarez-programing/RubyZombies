class AddZombieIdToBrain < ActiveRecord::Migration[5.0]
  def change
    add_reference :brains, :zombie, foreign_key: true
  end
end
