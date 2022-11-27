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
require "test_helper"

class TrainingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
