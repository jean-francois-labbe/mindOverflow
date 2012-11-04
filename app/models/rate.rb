class Rate < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :rateable, :polymorphic => true
end
