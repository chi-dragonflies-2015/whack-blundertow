class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: :true

  # validate :unique_user

  attr_reader :user, :votable

  ###this should be a custom validation
  def self.allowed_to_vote(current_user, current_votable)
    !current_votable.voters.include?(current_user)
  end
end
