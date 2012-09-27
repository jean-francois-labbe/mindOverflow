class Article < ActiveRecord::Base
  acts_as_taggable  
  attr_accessible :body, :title, :tag_list
  belongs_to :user
end
