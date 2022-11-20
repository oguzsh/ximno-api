class AddTitleToTrainingPrograms < ActiveRecord::Migration[7.0]
  def change
    add_column :training_programs, :title, :string, null: false
  end
end
