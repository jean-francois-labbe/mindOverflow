class Article < ActiveRecord::Base
  acts_as_taggable  
  attr_accessible :body, :title, :tag_list, :image
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  self.per_page = 5
end
