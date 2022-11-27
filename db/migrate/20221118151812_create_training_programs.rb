class CreateTrainingPrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :training_programs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
