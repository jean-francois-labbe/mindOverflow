class Rate < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :rateable, :polymorphic => true

  def self.rateable_rated_by_user(user,rateable)
    Rate.where(["user_id = ? and rateable_id = ?", user.id,rateable.id])
  end

end
