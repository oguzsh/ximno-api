# == Schema Information
#
# Table name: training_programs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :string           not null
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class TrainingProgram < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :trainings, dependent: :destroy
end
