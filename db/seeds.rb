require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all




#seed users

5.times do

  User.create(:username => Faker::Internet.user_name,
              :email => Faker::Internet.email ,
              :hashed_password =>'password')
end

#seeding questions
5.times do

  Question.create(:title => Faker::Lorem.sentence,
                    :body => Faker::Lorem.paragraph,
                    :user_id => rand(1..5),
                    :best_answer_id => nil
                    )
end

#seeding answers

5.times do
  Answer.create(:body => Faker::Lorem.paragraph,
                :user_id => rand(1..5),
                :question_id => rand(1..5)
                )
end


#seeding comments

5.times do
  Comment.create(:body => Faker::Lorem.sentence,
                :user_id => rand(1..5),
                :commentable_id => rand(1..5)
                )

end


#seeding votes

5.times do
  Vote.create(:value => [1,-1].sample,
              :votable_id => rand(1..5),
              :user_id => rand(1..5)
              )

end

