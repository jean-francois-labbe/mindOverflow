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

class Rate < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :rateable, :polymorphic => true

  def self.rateable_rated_by_user(user,rateable)
    Rate.where(["user_id = ? and rateable_id = ?", user.id,rateable.id])
  end
end
