class AddTrainerToPet < ActiveRecord::Migration[7.0]
  def change
    add_reference :pets, :trainer, null: false, foreign_key: true
  end
end
