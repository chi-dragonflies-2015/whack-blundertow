get '/questions/:question_id' do
  @question = Question.find_by(id: params[:question_id])
  erb :"questions/show"
end
