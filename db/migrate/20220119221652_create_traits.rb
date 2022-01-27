class CreateTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :traits do |t|
      t.string 'trait_type'
      t.string 'name', limit: 25
      t.timestamps
    end
  end
end
