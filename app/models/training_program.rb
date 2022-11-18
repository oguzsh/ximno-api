class TrainingProgram < ApplicationRecord
  belongs_to :user
  has_many :trainings
end
