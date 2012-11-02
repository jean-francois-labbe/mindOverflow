class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :first_name, :last_name, :nickname, :role
  validates :nickname, :presence => true

  has_many :articles
  has_many :favorites #, :as => :favable

  ROLES = %w[admin moderator author banned]

  def self.favorited_articles_by(user)
    articles = []
    user.favorites.each do |favorite|
      articles << favorite.favable
    end
    return articles
  end

end
