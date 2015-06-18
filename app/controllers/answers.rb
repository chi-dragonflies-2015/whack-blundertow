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

post '/questions/:question_id/answers' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_answer = Answer.create(body: params[:body], question_id: params[:question_id])
    this_user.answers << this_answer
    redirect "questions/#{params[:question_id]}"
  else
    @errors = "You must be logged in to do that"
    @questions = Question.all
    erb :index
  end
end
