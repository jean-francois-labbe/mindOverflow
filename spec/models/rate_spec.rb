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

require 'spec_helper'

describe Rate do
  pending "add some examples to (or delete) #{__FILE__}"
end
