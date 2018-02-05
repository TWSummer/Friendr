class User < ApplicationRecord
  validates :username, :password_digest, :session_token, :profile, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token
  attr_reader :password

  has_one :profile, dependent: :destroy
  has_one :search_query, dependent: :destroy
  has_many :question_answers, dependent: :destroy

  has_many :question_friend_answers,
  through: :question_answers,
  source: :question_friend_answers

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user
      pw = BCrypt::Password.new(user.password_digest)
      if pw.is_password?(password)
        return user
      end
    end
    nil
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    save
  end
end
