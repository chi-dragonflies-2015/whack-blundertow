get "/" do
  @questions = Question.all
  erb :"index"
end

get "/question" do
  @question = Question.find(1)

  erb :"question"
end
