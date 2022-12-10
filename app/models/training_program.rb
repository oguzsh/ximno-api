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
  has_many :training_pools
  has_many :trainings, through: :training_pools
end
