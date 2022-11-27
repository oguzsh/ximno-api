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
require "test_helper"

class TrainingProgramTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
