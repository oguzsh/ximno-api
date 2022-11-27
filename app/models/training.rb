# == Schema Information
#
# Table name: trainings
#
#  id                  :bigint           not null, primary key
#  title               :string
#  description         :text
#  rep_count           :integer
#  duration            :time
#  training_program_id :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Training < ApplicationRecord
  has_and_belongs_to_many :training_programs, dependent: :destroy
end
