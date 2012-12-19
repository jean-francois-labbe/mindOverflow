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

class Favorite < ActiveRecord::Base

  include ActsAsFavable::Favorite

  attr_accessible :user_id
  belongs_to :favable, :polymorphic => true

  default_scope :order => 'created_at ASC'

  # NOTE: Favorite belongs to a user
  belongs_to :user

  def self.find_favorite_by_user_for_favable(user,favable)
    Favorite.where(["user_id = ? and favable_id = ?", user.id,favable.id])
  end

end
