get '/answers/:answer_id/best' do
  this_user = User.find(session[:user_id])
  this_answer = Answer.find(params[:answer_id])
  this_question = this_answer.question
  if this_user && this_question.user == this_user && this_question.best_answer_id == nil
    this_question.best_answer_id = this_answer.id
    redirect "/questions/#{this_question.id}"
  else
    @errors = "This action is not allowed"
    redirect "/index"
  end
end
