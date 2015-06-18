class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments


  validates :email, {uniqueness: true, presence: true}
  validates :username, {uniqueness: true, presence: true}

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(entered_password)
    self.hashed_password = BCrypt::Password.create(entered_password)
  end

  def self.authenticate(username, entered_password)
    user = User.find_by(username: username)
    if user && user.password == entered_password
      return user
    else
      return nil
    end
  end

end
