class Article < ActiveRecord::Base
  acts_as_taggable_on :tags
  attr_accessible :body, :title, :tag_list, :image, :user_id
  belongs_to :user
  delegate :nickname, :to => :user, :prefix => true
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates :title, :presence => true
  validates :body, :presence => true

  acts_as_favable
  has_many :rates, :as => :rateable


  def is_favorited_by_user?(user)
    article_user_favorites(user).any?
  end

  def article_user_favorites(user)
    Favorite.find_favorite_by_user_for_favable(user,self)
  end

  def favorited_by(user)
    self.favorites.create(:user_id => user.id)
  end

  def rated_by(user, rate)
    self.rates.create(:user_id => user.id)
    if self.rate.nil?
      self.rate = rate
    else
      self.rate = self.rate + rate
    end
    self.save
  end

  self.per_page = 10
end
