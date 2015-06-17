class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments


  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(entered_password)
    self.hashed_password = BCrypt::Password.create(entered_password)
  end

  def self.authenticate(email, entered_password)
    user = User.find_by(email: email)
    if user && user.password == entered_password
      return user
    else
      return nil
    end
  end

end
