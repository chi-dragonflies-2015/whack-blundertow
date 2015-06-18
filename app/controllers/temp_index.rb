get "/" do
  @questions = Question.all
  erb :"index"
end

get "/question" do
  @question = Question.find(3)
  @q_comments = @question.comments
  @answers = @question.answers


  erb :"question"
end
