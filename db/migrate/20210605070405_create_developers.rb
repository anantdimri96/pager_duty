class CreateDevelopers < ActiveRecord::Migration[6.0]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :phone_number
      t.integer :team_id
      t.timestamps
    end
  end
end






