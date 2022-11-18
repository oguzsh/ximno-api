# == Schema Information
#
# Table name: training_programs
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  training_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class TrainingProgram < ApplicationRecord
  belongs_to :user
  has_many :trainings
end
