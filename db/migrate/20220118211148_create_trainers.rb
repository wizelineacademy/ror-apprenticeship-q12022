class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :last_name
      t.integer :age
      t.string :region
      t.string :hometown

      t.timestamps
    end
  end
end
