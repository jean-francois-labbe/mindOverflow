class Article < ActiveRecord::Base
  acts_as_taggable
  attr_accessible :body, :title, :tag_list, :image
  belongs_to :user
  delegate :nickname, :to => :user, :prefix => true
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates :title, :presence => true
  validates :body, :presence => true

  self.per_page = 5
end
