class CreateTrainingProgramsTrainingsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :training_programs_trainings, id: false do |t|
      t.belongs_to :training_program
      t.belongs_to :training
    end
  end
end
