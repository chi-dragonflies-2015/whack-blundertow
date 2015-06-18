class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :best_answer, class_name: "Answer", foreign_key: "best_answer_id"
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :voters, through: :votes, source: :user

  validates :title, {presence: true}
  validates :body, {presence: true}
end
