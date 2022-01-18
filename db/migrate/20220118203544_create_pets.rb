class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :gender
      t.string :caught_at

      t.timestamps
    end
  end
end
