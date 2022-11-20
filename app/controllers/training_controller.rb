class TrainingController < ApplicationController
  before_action :set_training, only: %i[show destory]

  def create
    @training = current_user.trainings.new(training_params)

    if @training.save
      redirect_to root_path, notice: 'Training was created successfully!'
    else
      errors = @training.errors.full_messages.join(', ')
      redirect_to new_training_path, alert: "Training was not created because #{errors}"
    end
  end

  def show
    @training
  end

  def destory
    @training.destory
  end

  private

  def set_training
    @training = Training.find(params[:id])
  end

  def training_params
    params.require(:training).permit(:name, :description, :user)
  end
end
