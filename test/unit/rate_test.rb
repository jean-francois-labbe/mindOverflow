# == Schema Information
#
# Table name: rates
#
#  id            :integer          not null, primary key
#  rateable_id   :integer
#  rateable_type :string(255)
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class RateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
