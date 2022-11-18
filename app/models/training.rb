# == Schema Information
#
# Table name: trainings
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  set_count  :integer
#  duration   :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Training < ApplicationRecord
  has_many :training_programs
end
