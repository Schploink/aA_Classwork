class User < ApplicationRecord

  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :password, allow_nil: true
  before_validation :ensure_session_token

  attr_reader :password

  has_many :subs,
  foreign_key: :moderator_id,
  class_name: :Sub

  has_many :posts,
  foreign_key: :author_id,
  class_name: :Post

  #SPIRE
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password)? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    password_object = BCrypt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::base64
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::base64
  end
end
