class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :first_name, :last_name, :nickname, :role, :approved
  validates :nickname, :presence => true

  has_many :articles
  has_many :favorites
  has_many :rates

  ROLES = %w[admin moderator author banned]

  def self.favorited_articles_by(user)
    articles = []
    user.favorites.each do |favorite|
      articles << favorite.favable
    end
    return articles
  end

  after_initialize :set_default_roles


  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super :signed_up_but_not_approved
    end
  end


  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end

  private
  def set_default_roles
    if User.count == 0
      self.role = "admin"
      self.approved = true
    else
      self.role = self.role || "author"
    end
  end

end
