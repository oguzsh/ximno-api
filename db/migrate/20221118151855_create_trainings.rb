class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.string :title
      t.text :description
      t.integer :rep_count
      t.time :duration

      t.timestamps
    end
  end
end
