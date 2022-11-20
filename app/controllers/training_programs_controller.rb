class TrainingProgramsController < ApplicationController
  before_action :set_training_program, only: %i[index show destory]

  def index
    @training_programs = TrainingProgram.all.order(created_at: :desc)
  end

  def create
    @training_program = current_user.training_program.new(training_params)

    if @training_program.save
      redirect_to root_path, notice: 'Training program was created successfully!'
    else
      errors = @training_program.errors.full_messages.join(', ')
      redirect_to new_training_path, alert: "Training program was not created because #{errors}"
    end
  end

  def show
    @training_program
  end

  def destory
    @training_program.destory
  end

  private

  def set_training_program
    @training_program = TrainingProgram.find(params[:id])
  end

  def training_programs_params
    params.require(:training_program).permit(:name, :training, :user)
  end
end
