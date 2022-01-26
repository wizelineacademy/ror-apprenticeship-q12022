class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string 'trainer_tag', limit: 25
      t.string 'team_name'
      # t.string 'email', null: false
      # t.string 'password', limit: 30
      t.timestamps
    end
  end
end
