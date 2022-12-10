class CreateTrainingPools < ActiveRecord::Migration[7.0]
  def change
    create_table :training_pools do |t|
      t.belongs_to :training, null: false, foreign_key: true
      t.belongs_to :training_program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
