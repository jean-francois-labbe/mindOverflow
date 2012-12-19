# == Schema Information
#
# Table name: favorites
#
#  id           :integer          not null, primary key
#  note         :string(50)       default("")
#  favable_id   :integer
#  favable_type :string(255)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Favorite do
  pending "add some examples to (or delete) #{__FILE__}"
end
